set -e -x
cluster_name=efm
efm_version=$(echo /usr/edb/efm-*/ | awk -F/ '{print $4}' | cut -c 5- )
status() {
   /usr/edb/efm-*/bin/efm cluster-status $cluster_name
}
start() {
   # TODO cannot start
   sudo systemctl start edb-efm-$efm_version
   
}

passwd-swap() {

   local password=$1

   if [[ -n $password ]]; then
      export EFMPASS=$password
      /usr/edb/efm-*/bin/efm encrypt $cluster_name --from-env
   else
      # Interactive
      /usr/edb/efm-*/bin/efm encrypt $cluster_name
   fi

}

setup() {
   config_path="/etc/edb/efm-$efm_version/$cluster_name.properties"
   sudo cp /etc/edb/efm-$efm_version/efm.properties.in $config_path
   sudo chown efm:efm $config_path
}
configure-cluster() {
   local password=$1
   if [[ -z $password ]]; then
      echo password is required
      exit 1
   fi

   local password_e=$(passwd-swap $password)
   local db_bin=$(echo /usr/edb/as*/bin)
   local db_version=$(echo $db_bin | awk -F/ '{print $4}')
   local remote_edit="https://raw.githubusercontent.com/davidkhala/linux-utils/refs/heads/main/editors.sh"

   local config_path="/etc/edb/efm-$efm_version/$cluster_name.properties"

   curl $remote_edit | bash -s configure db.user=enterprisedb $config_path
   curl $remote_edit | bash -s configure db.port=5444 $config_path
   curl $remote_edit | bash -s configure db.database=edb $config_path
   curl $remote_edit | bash -s configure db.service.owner=enterprisedb $config_path
   curl $remote_edit | bash -s configure bind.address=0.0.0.0:7800 $config_path
   curl $remote_edit | bash -s configure is.witness=false $config_path

   curl $remote_edit | bash -s configure db.password.encrypted=$password_e $config_path
   curl $remote_edit | bash -s configure db.bin=$db_bin $config_path

   # db.data.dir: Same as the output of query `show data_directory;`. It is newly introduced in EFM 4.0 for pg 12. Equivalent to `db.recovery.conf.dir` in EFM 3.x
   curl $remote_edit | bash -s configure db.data.dir=/var/lib/edb/$db_version/data $config_path

   
}

$@
