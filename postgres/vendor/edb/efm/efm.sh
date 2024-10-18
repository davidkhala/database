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

configure(){
   sudo vi "/etc/edb/efm-$efm_version/$cluster_name.properties"
   sudo systemctl restart edb-efm-$efm_version
   status
   
}

configure-cluster() {
   local password_e=$(passwd-swap $1)
   local db_version=$(echo $db_bin | awk -F/ '{print $4}')
   local remote_edit="https://raw.githubusercontent.com/davidkhala/linux-utils/refs/heads/main/editors.sh"

   if [[ -z $user_email ]]; then
      user_email=$(git config user.email)
      if [[ -z $user_email ]]; then
         echo user.email is required
         return 1
      fi
   fi

   # TODO the configurer will add new line on empty value entry
   curl $remote_edit | bash -s configure db.user=enterprisedb $config_path
   curl $remote_edit | bash -s configure db.port=5444 $config_path
   curl $remote_edit | bash -s configure db.database=edb $config_path
   curl $remote_edit | bash -s configure db.service.owner=enterprisedb $config_path
   curl $remote_edit | bash -s configure is.witness=false $config_path
   
   # bind.address need to aligned with pg_hba.conf
   local ip=$(hostname -i) # internal ip
   curl $remote_edit | bash -s configure bind.address=$ip:7800 $config_path
   
   curl $remote_edit | bash -s configure db.password.encrypted=$password_e $config_path
   curl $remote_edit | bash -s configure db.bin=$db_bin $config_path

   # db.data.dir: Same as the output of query `show data_directory;`. It is newly introduced in EFM 4.0 for pg 12. Equivalent to `db.recovery.conf.dir` in EFM 3.x
   curl $remote_edit | bash -s configure db.data.dir=/var/lib/edb/$db_version/data $config_path
   curl $remote_edit | bash -s configure script.notification=$db_bin/logger.sh $config_path

}

$@
