set -e
# TODO: the context have to be within vm console, cannot be another console like GCP Cloud Console and executed by `gcloud compute ssh`
setup-vm() {
    sudo apt-get install -y sshpass
    ssh-vbox-vm "curl https://raw.githubusercontent.com/davidkhala/databases/main/teradata/teradata.sh -O; chmod +x ./teradata.sh; ./teradata.sh wait-until-health"
}
wait-until-port-4422() {
    counter=0
    
    while true; do
        if nc -w 1 -z $hostname 4422; then
            break
        else
            ((counter++))
            sleep 1
            echo ${counter} times retry
        fi

    done

}

ssh-vbox-vm() {
    sshpass -p root ssh -o StrictHostKeyChecking=no -p 4422 root@${hostname:-localhost} $@
}
$@
