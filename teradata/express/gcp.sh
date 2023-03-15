create-vm(){
  gcloud compute instances create teradata-vantage-express --zone=asia-east2-c --machine-type=n2-custom-4-8192 --enable-nested-virtualization \
  --create-disk=boot=yes,device-name=ve-disk,image-project=ubuntu-os-cloud,image-family=ubuntu-2004-lts,size=70,type=pd-balanced 

}
ssh-vm(){
  gcloud compute ssh teradata-vantage-express --zone=asia-east2-c
}

$@




  
