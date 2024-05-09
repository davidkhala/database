curl https://objectstorage.ap-singapore-1.oraclecloud.com/n/cn9yc2hk0gzg/b/installation-binary/o/maria%2Fmariadb-5.5.68-linux-systemd-x86_64.tar.gz | tar xvfz -

sudo mv mariadb-5.5.68-linux-systemd-x86_64 /usr/local/mysql/

sudo groupadd mysql
sudo useradd -g mysql mysql

sudo chown -R mysql /usr/local/mysql/
sudo chgrp -R mysql /usr/local/mysql/
sudo mkdir -p /usr/local/mysql/data/
sudo chown -R mysql /usr/local/mysql/data
sudo /usr/local/mysql/scripts/mysql_install_db --user=mysql --datadir=/usr/local/mysql/data/

# start daemon
sudo /usr/local/mysql/bin/mysqld_safe --user=mysql --datadir=/usr/local/mysql/data/

# change root
export MARIADB_ROOT_PASSWORD=password
/usr/local/mysql/bin/mysqladmin -u root password ${MARIADB_ROOT_PASSWORD}

# for oracle linux, required to use `mysql`
sudo yum install -y libncurses*
# connect
export PATH=${PATH}:/usr/local/mysql/bin/
query="CREATE USER 'root'@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}'"
# FIXME, the password inject might not work
mysql -u root --password=${MARIADB_ROOT_PASSWORD} -e "${query}"
mysql -u root --password=${MARIADB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%'"

