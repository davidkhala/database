trino-CLI(){
  java -version
  wget https://repo1.maven.org/maven2/io/trino/trino-cli/405/trino-cli-405-executable.jar trino
  chmod +x ./trino
  ./trino --version

}

$@
