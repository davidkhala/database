db_version=$(echo /usr/edb/as*/bin/ | awk -F/ '{print $4}' | cut -c 3-)
postgresql_conf=/var/lib/edb/as$db_version/data/postgresql.conf

# setup stream replication
setup() {
    sudo curl https://raw.githubusercontent.com/davidkhala/database/refs/heads/main/postgres/vendor/edb/as/postgresql.conf -o $postgresql_conf
    echo "host    replication     all             0.0.0.0/0               md5" | sudo tee -a /var/lib/edb/as$db_version/data/pg_hba.conf
}
