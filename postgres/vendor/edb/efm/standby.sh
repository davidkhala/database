nodes_config_path=$(echo "/etc/edb/efm-*/efm.nodes")
join() {
    echo $1:7800 | sudo tee -a $nodes_config_path
}
