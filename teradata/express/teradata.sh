set -e
export VM_IMAGE_DIR="${HOME}/VantageExpress17.20_Sles12"
mkdir -p $VM_IMAGE_DIR
setup-vbox-vm() {
    start-attach
    set-autostart
    sudo apt-get install -y sshpass
    wait-until-vbox-vm
    ssh-vbox-vm "curl https://raw.githubusercontent.com/davidkhala/databases/main/teradata/teradata.sh -O; chmod +x ./teradata.sh; ./teradata.sh wait-until-health"
}

apt-install() {
    sudo apt update && sudo apt-get install virtualbox p7zip-full p7zip-rar -y
}
download-OVA() {
    # .ova is for GUI-based Virtualbox VM install, please use disk 1,2,3 for CLI-based Virtualbox VM install
    wget -O $VM_IMAGE_DIR/vbox.ova https://objectstorage.ap-singapore-1.oraclecloud.com/n/cn9yc2hk0gzg/b/installation-binary/o/teradata%2FVantageExpress_VirtualBoxAppliance_17.20_Sles12_20220819081111.ova

}
download-disks() {

    wget -O $VM_IMAGE_DIR/ve.7z https://objectstorage.ap-singapore-1.oraclecloud.com/n/cn9yc2hk0gzg/b/installation-binary/o/teradata%2FVantageExpress17.20_Sles12_20230220064202.7z
    7z x $VM_IMAGE_DIR/ve.7z
}
start-attach() {

    DEFAULT_VM_NAME="vantage-express"
    VM_NAME="${VM_NAME:-$DEFAULT_VM_NAME}"
    vboxmanage createvm --name "$VM_NAME" --register --ostype openSUSE_64
    vboxmanage modifyvm "$VM_NAME" --ioapic on --memory 6000 --vram 128 --nic1 nat --cpus 4
    vboxmanage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAhci

    set -e
    [[ -n $(find $VM_IMAGE_DIR -name '*disk1*') ]] # ensure file exist
    [[ -n $(find $VM_IMAGE_DIR -name '*disk2*') ]] # ensure file exist
    [[ -n $(find $VM_IMAGE_DIR -name '*disk3*') ]] # ensure file exist

    vboxmanage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$(find $VM_IMAGE_DIR -name '*disk1*')"
    vboxmanage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 1 --device 0 --type hdd --medium "$(find $VM_IMAGE_DIR -name '*disk2*')"
    vboxmanage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 2 --device 0 --type hdd --medium "$(find $VM_IMAGE_DIR -name '*disk3*')"
    vboxmanage modifyvm "$VM_NAME" --natpf1 "tdssh,tcp,,4422,,22"
    vboxmanage modifyvm "$VM_NAME" --natpf1 "tddb,tcp,,1025,,1025"
    vboxmanage startvm "$VM_NAME" --type headless
    vboxmanage controlvm "$VM_NAME" keyboardputscancode 1c 1c

}
wait-until-vbox-vm() {
    counter=0
    while true; do
        if ssh-vbox-vm true; then
            exit 0
        else
            ((counter++))
            sleep 1
            echo ${counter} times retry
        fi
    done
}
ssh-vbox-vm() {
    sshpass -p root ssh -o StrictHostKeyChecking=no -p 4422 root@localhost $@
}
set-autostart() {
    sudo wget -O /etc/default/virtualbox https://objectstorage.ap-singapore-1.oraclecloud.com/n/cn9yc2hk0gzg/b/installation-binary/o/teradata%2Fvirtualbox
    sudo wget -O /etc/systemd/system/vantage-express.service https://objectstorage.ap-singapore-1.oraclecloud.com/n/cn9yc2hk0gzg/b/installation-binary/o/teradata%2Fvantage-express.service

    sudo systemctl daemon-reload
    sudo systemctl enable vantage-express # inline start can fail due to vantage-express vm is running.

}
$@
