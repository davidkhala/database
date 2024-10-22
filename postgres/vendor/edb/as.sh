set -e
db_user=enterprisedb
db_version=$(echo /usr/edb/as*/bin/ | awk -F/ '{print $4}' | cut -c 3-)
service_name=edb-as-$db_version.service
setup() {
  # post install
  sudo PGSETUP_INITDB_OPTIONS="-E UTF-8" /usr/edb/as$db_version/bin/edb-as-$db_version-setup initdb
  # Refer: https://www.postgresql.org/docs/current/auth-pg-hba-conf.html
  echo "host    all             all             0.0.0.0/0               md5" | sudo tee -a /var/lib/edb/as$db_version/data/pg_hba.conf
  echo "host    replication     all             0.0.0.0/0               md5" | sudo tee -a /var/lib/edb/as$db_version/data/pg_hba.conf # TODO
  # init password for Peer authN
  local password=$1
  if [[ -n $password ]]; then
    echo "$password" | sudo passwd $db_user --stdin
  else
    # Interactive
    sudo passwd $db_user
  fi
  
  sudo systemctl enable --now $service_name
  # init password for password authN
  sudo -u $db_user psql -U $db_user -d edb -c "ALTER USER $db_user PASSWORD '$password';"
}
restart() {
  sudo systemctl restart $service_name
}

connect-peer() {
  # peer authN is the default AuthN method
  sudo -u $db_user psql -U $db_user -d edb
}
connect() {
  psql -U $db_user -h $(hostname) -d edb $@
}

$@
