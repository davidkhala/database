containerName=scylla
run() {
  docker run --name $containerName -d scylladb/scylla
}
status() {
  docker exec -it $containerName nodetool status  
}
cql(){
  docker exec -it $containerName cqlsh $@
}




$@
