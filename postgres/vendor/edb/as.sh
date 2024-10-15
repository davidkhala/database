set -x
db_bin=$(echo /usr/edb/as*/bin)

setup(){
  # post install
  sudo PGSETUP_INITDB_OPTIONS="-E UTF-8" /usr/edb/as*/bin/edb-as-11-setup initdb
}
connect(){
  psql -d edb -U enterprisedb
}

$@
