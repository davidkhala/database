cluster_name=efm
allow-standby() {
    sudo -u efm /usr/edb/efm-*/bin/efm allow-node $cluster_name $1
}
