set -e
efm_version=$(echo /usr/edb/efm-*/ | awk -F/ '{print $4}' | cut -c 5-)
db_bin=$(echo /usr/edb/as*/bin)
set -x
cluster_name=efm
config_path="/etc/edb/efm-$efm_version/$cluster_name.properties"
nodes_config_path="/etc/edb/efm-$efm_version/efm.nodes"
status() {
   tail /var/log/efm-$efm_version/startup-efm.log
   /usr/edb/efm-*/bin/efm cluster-status $cluster_name
}

passwd-swap() {

   if [[ -z $EFMPASS ]]; then
      export EFMPASS=$1
      if [[ -z $EFMPASS ]]; then
         # Interactive
         /usr/edb/efm-*/bin/efm encrypt $cluster_name
         return
      fi
   fi
   /usr/edb/efm-*/bin/efm encrypt $cluster_name --from-env

}

setup() {

   if [ ! -f $config_path ] || [[ -n $overwrite ]]; then
      sudo cp /etc/edb/efm-$efm_version/efm.properties.in $config_path
      sudo chown efm:efm $config_path
   fi

   if [ ! -f $nodes_config_path ] || [[ -n $overwrite ]]; then
      # The cluster members file on the first node started can be empty.
      # When an agent starts, it uses the file to locate other cluster members.
      sudo cp /etc/edb/efm-$efm_version/efm.nodes.in $nodes_config_path
      sudo chown efm:efm $nodes_config_path
   fi
   if [ ! -f $db_bin/logger.sh ] || [[ -n $overwrite ]]; then
      sudo curl https://raw.githubusercontent.com/davidkhala/database/refs/heads/main/postgres/vendor/edb/efm/logger.sh -o $db_bin/logger.sh
      sudo chmod +x $db_bin/logger.sh
      sudo chown efm:efm $db_bin/logger.sh
   fi
   configure-cluster $1

   sudo systemctl enable --now edb-efm-$efm_version
}
restart() {
   sudo systemctl restart edb-efm-$efm_version
}

configure-cluster() {
   local password=$1
   if [[ -z $password ]]; then
      echo password is required
      return 1
   fi

   local password_e=$(passwd-swap $password)
   local db_version=$(echo $db_bin | awk -F/ '{print $4}')

   if [[ -z $user_email ]]; then
      if git config user.email; then
         user_email=$(git config user.email)
      fi
   fi

   curl https://raw.githubusercontent.com/davidkhala/linux-utils/refs/heads/main/editors.sh >editors.sh

   chmod +x editors.sh

   ./editors.sh configure db.user=enterprisedb $config_path
   ./editors.sh configure db.port=5444 $config_path
   ./editors.sh configure db.database=edb $config_path
   ./editors.sh configure db.service.owner=enterprisedb $config_path
   ./editors.sh configure is.witness=false $config_path

   # bind.address need to aligned with pg_hba.conf
   local ip=$(hostname -i) # internal ip

   ./editors.sh configure bind.address=$ip:7800 $config_path

   ./editors.sh configure db.password.encrypted=$password_e $config_path
   ./editors.sh configure db.bin=$db_bin $config_path "|"

   # db.data.dir: Same as the output of query `show data_directory;`. It is newly introduced in EFM 4.0 for pg 12. Equivalent to `db.recovery.conf.dir` in EFM 3.x
   ./editors.sh configure db.data.dir=/var/lib/edb/$db_version/data $config_path "|"
   if [[ -z $user_email ]]; then
      ./editors.sh configure script.notification=$db_bin/logger.sh $config_path "|"
   else
      ./editors.sh configure user.email=$user_email $config_path
   fi

   local db_version=$(echo /usr/edb/as*/bin/ | awk -F/ '{print $4}' | cut -c 3-)
   ./editors.sh configure db.service.name=edb-as-$db_version $config_path # optional

   rm editors.sh
}

$@
