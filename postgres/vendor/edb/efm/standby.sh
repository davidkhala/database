set -e -x
efm_version=$(echo /usr/edb/efm-*/ | awk -F/ '{print $4}' | cut -c 5-)
db_version=$(echo /usr/edb/as*/bin/ | awk -F/ '{print $4}' | cut -c 3-)

nodes_config_path=/etc/edb/efm-$efm_version/efm.nodes
join() {
    sudo systemctl stop edb-as-$db_version
    sudo touch /var/lib/edb/as$db_version/data/standby.signal # for pg 12+
    sudo systemctl start edb-as-$db_version
    
    if ! grep "$1:7800" $nodes_config_path; then
        echo $1:7800 | sudo tee -a $nodes_config_path
    fi

    sudo systemctl restart edb-efm-$efm_version
}
$@