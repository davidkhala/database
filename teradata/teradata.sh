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
  curl -sSL https://raw.githubusercontent.com/davidkhala/linux-utils/main/wait-until.sh | sudo bash -s db-health
}
$@
