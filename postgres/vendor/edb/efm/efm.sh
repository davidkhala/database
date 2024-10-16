set -e -x
efm() {
   /usr/edb/efm-*/bin/efm $@
}
version() {
   efm --version
}

passwd-swap() {

   local password=$1
   local cluster_name=efm
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

   # TODO: sudo cp efm.nodes.in efm.nodes
   # TODO: sudo chown efm:efm efm.nodes

   cd -
}
configure-cluster() {
   local password=$1
   local password_e=$(passwd-swap $password)
   local db_bin=$(echo /usr/edb/as*/bin)
   local remote_edit="https://raw.githubusercontent.com/davidkhala/linux-utils/refs/heads/main/editors.sh"
   cd /etc/edb/efm-*/

   curl $remote_edit | bash -s configure db.password.encrypted=$password_e efm.properties
   curl $remote_edit | bash -s configure db.bin=$db_bin efm.properties
   curl $remote_edit | bash -s configure db.bin=$db_bin efm.properties
   # WON'T DO: db.data.dir: Same as the output of query `show data_directory;`. It is newly introduced in EFM 4.0 for pg 12
   curl $remote_edit | bash -s configure is.witness=false efm.properties

   cd -
}

configure-node(){

}

$@
