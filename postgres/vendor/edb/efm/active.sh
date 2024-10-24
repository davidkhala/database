set -e
cluster_name=efm
allow-standby() {
    local standbyIP=$1
    sudo -u efm /usr/edb/efm-*/bin/efm allow-node $cluster_name $standbyIP
    curl https://raw.githubusercontent.com/davidkhala/database/refs/heads/main/postgres/vendor/edb/efm/efm.sh | bash -s status
}
$@
