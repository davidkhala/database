set -e
db-health() {
  # validate the db is up
  if ! pdestate -a | grep "PDE state is RUN/STARTED."; then
    exit 1
  fi
  if ! pdestate -a | grep "DBS state is 5: Logons are enabled - The system is quiescent"; then
    exit 1
  fi
}
wait-until-health() {
  counter=0
  while true; do
    if db-health; then
      break;
    else
      counter=counter+1
      sleep 1
      echo ${counter} times retry
    fi
  done
}
$@
