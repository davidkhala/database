set -x
db_bin=$(echo /usr/edb/as*/bin)

db_user=enterprisedb
setup(){
  # post install
  sudo PGSETUP_INITDB_OPTIONS="-E UTF-8" /usr/edb/as*/bin/edb-as-11-setup initdb
  start
  sudo passwd $db_user
}
start(){
  # systemctl { start | stop | restart } edb-as-*  
  systemctl enable --now edb-as-*
}

connect(){
  sudo -u $db_user psql -d edb -U $db_user
}

$@
