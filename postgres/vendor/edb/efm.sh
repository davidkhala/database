set -e
efm() {
   /usr/edb/efm-*/bin/efm $@
}
version() {
   efm --version
}

password-swap(){
   # Interactive 
   local password=$1
   local cluster_name=efm
   if [ -n $password ]; then
      export EFMPASS=$password
      efm encrypt $cluster_name --from-env
   else
      efm encrypt $cluster_name
   fi
   
   
}


configure() {
   cd /etc/edb/efm-*/
   sudo cp efm.properties.in efm.properties
   # After copying the template file, change the owner of the file to efm:
   sudo chown efm:efm efm.properties
   cd -
}

$@
