set -e
vm_name=${name:-teradata-vantage-express}
export zone=${zone:-asia-east2-c}
create-vm() {
  gcloud compute instances create ${vm_name} --zone=${zone} --machine-type=n2-custom-4-8192 --enable-nested-virtualization \
    --create-disk=boot=yes,device-name=ve-disk,image-project=ubuntu-os-cloud,image-family=ubuntu-2004-lts,size=70,type=pd-standard
  curl https://raw.githubusercontent.com/davidkhala/gcp-collections/main/compute/cli/gcloud.sh | bash -s wait-until-ssh ${vm_name}
}
ssh-vm() {
  gcloud compute ssh ${vm_name} --zone=${zone}
}
setup-vm() {
  gcloud compute ssh ${vm_name} --zone=${zone} --command="wget https://raw.githubusercontent.com/davidkhala/databases/main/teradata/express/teradata.sh; chmod +x ./teradata.sh;"
  gcloud compute ssh ${vm_name} --zone=${zone} --command="./teradata.sh setup"
  export hostname=$(curl -s https://raw.githubusercontent.com/davidkhala/gcp-collections/main/compute/cli/gcloud.sh | bash -s get-ip ${vm_name})
  curl -s https://raw.githubusercontent.com/davidkhala/databases/main/teradata/express/teradata-vbox.sh | bash -s setup-vm
  
}
delete-vm() {
  gcloud compute instances delete ${vm_name} --zone=${zone} --quiet
}

$@
