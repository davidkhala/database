set -e
db_user=enterprisedb
db_version=$(echo /usr/edb/as*/bin/ | awk -F/ '{print $4}' | cut -c 3-)
setup() {
  # post install
  sudo PGSETUP_INITDB_OPTIONS="-E UTF-8" /usr/edb/as$db_version/bin/edb-as-$db_version-setup initdb
  start

  # Setup initial password for default DB user
  local password=$1
  if [[ -n $password ]]; then
    echo "$password" | sudo passwd $db_user --stdin
  else
    # Interactive
    sudo passwd $db_user
  fi

}
start() {
  local service_name=edb-as-$db_version.service

  sudo systemctl enable --now $service_name
}
configure-authN() {
  # Refer: https://www.postgresql.org/docs/current/auth-pg-hba-conf.html
  sudo vi /var/lib/edb/as$db_version/data/pg_hba.conf
  # change method=peer to method=trust|md5 for 127.0.0.1
  
}
connect-peer() {
  # peer authN: the default AuthN method
  sudo -u $db_user psql -U $db_user -d edb $@
}
connect() {
  psql -U $db_user -d edb $@
}

$@
