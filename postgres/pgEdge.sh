install(){
  echo "OS must be Linux"
  python3 -c "$(curl -fsSL https://pgedge-download.s3.amazonaws.com/REPO/install.py)"
  ./pgedge/nodectl install pgedge # -U user -P passwd -d mydb
}

$@
