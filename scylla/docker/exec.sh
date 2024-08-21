containerName=scylla
run() {
  docker run --name $containerName -d scylladb/scylla
}
status() {
  docker exec -it $containerName nodetool status  
}
cql(){
  # Interactive
  docker exec -it $containerName cqlsh $@
}
restart() {
  docker exec -it $containerName supervisorctl restart scylla
}
dirty2(){
  docker run -d scylladb/scylla --seeds="$(docker inspect --format='{{ .NetworkSettings.IPAddress }}' $containerName)"
}


$@
