set -e
cluster_name=efm
allow-standby() {
    sudo -u efm /usr/edb/efm-*/bin/efm allow-node $cluster_name $1
    curl https://raw.githubusercontent.com/davidkhala/database/refs/heads/main/postgres/vendor/edb/efm/efm.sh | bash -s status
}
$@
