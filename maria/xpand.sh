run() {
  docker run --detach \
   --name mariadb-xpand \
   --publish '3306:3306/tcp' \
   mariadb/xpand-single:latest \
   --mini
}
$@
