run() {
  docker run -d --name mariadb-xpand --publish '3306:3306/tcp' mariadb/xpand-single:latest --mini
}
exec(){
  docker exec --interactive --tty mariadb-xpand mariadb --user=xpand --password=
}
$@
