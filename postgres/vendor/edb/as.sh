set -e
db_user=enterprisedb
setup() {
  # post install
  sudo PGSETUP_INITDB_OPTIONS="-E UTF-8" /usr/edb/as*/bin/edb-as-*-setup initdb
  start

  # interactive setup initial password for default DB user
  sudo passwd $db_user
}
start() {
  # systemctl { start | stop | restart } edb-as-*
  local service_name=$(systemctl list-units --type=service --all | grep edb-as- | awk '{print $1}')

  sudo systemctl enable --now $service_name
}

connect() {
  # peer authN: the default AuthN method
  sudo -u $db_user psql -U $db_user -d edb $@
}

$@
