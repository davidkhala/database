set -e
trino-CLI() {
  java -version
  wget https://repo1.maven.org/maven2/io/trino/trino-cli/405/trino-cli-405-executable.jar -O trino
  chmod +x ./trino
  ./trino --version

}
login() {
  
  ./trino --server http://${domain:-localhost}:8080
}

$@
