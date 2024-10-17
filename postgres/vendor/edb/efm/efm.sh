set -e -x
cluster_name=efm
efm() {
   /usr/edb/efm-*/bin/efm $@
}
version() {
   efm --version
}
status() {
   efm cluster-status $cluster_name
}

passwd-swap() {

   local password=$1

   if [[ -n $password ]]; then
      export EFMPASS=$password
      efm encrypt $cluster_name --from-env
   else
      # Interactive
      efm encrypt $cluster_name
   fi

}

setup() {
   cd /etc/edb/efm-*/

   sudo cp efm.properties.in efm.properties
   sudo chown efm:efm efm.properties

   cd -
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
   cd /etc/edb/efm-*/

   curl $remote_edit | bash -s configure db.user=enterprisedb efm.properties
   curl $remote_edit | bash -s configure db.port=5444 efm.properties
   curl $remote_edit | bash -s configure db.database=edb efm.properties
   curl $remote_edit | bash -s configure db.service.owner=enterprisedb efm.properties
   curl $remote_edit | bash -s configure bind.address=0.0.0.0:7800 efm.properties
   curl $remote_edit | bash -s configure is.witness=false efm.properties

   curl $remote_edit | bash -s configure db.password.encrypted=$password_e efm.properties
   curl $remote_edit | bash -s configure db.bin=$db_bin efm.properties

   # db.data.dir: Same as the output of query `show data_directory;`. It is newly introduced in EFM 4.0 for pg 12. Equivalent to `db.recovery.conf.dir` in EFM 3.x
   curl $remote_edit | bash -s configure db.data.dir=/var/lib/edb/$db_version/data efm.properties
   # TODO The 'user.email' or 'script.notification' property must be set. # For legacy

   cd -
}

$@
