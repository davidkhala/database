set -e
efm(){
   /usr/edb/efm-*/bin/efm $@
}
version(){
   efm --version
}

configure(){
   cd /etc/edb/efm-*/
   sudo cp efm.properties.in efm.properties
   # After copying the template file, change the owner of the file to efm:
   sudo chown efm:efm efm.properties
   cd -
}


$@
