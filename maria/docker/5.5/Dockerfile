# https://archive.mariadb.org//mariadb-5.5.68/bintar-linux-systemd-x86_64/mariadb-5.5.68-linux-systemd-x86_64.tar.gz
FROM centos
RUN groupadd mysql
RUN useradd -g mysql mysql

WORKDIR /usr/local
RUN curl https://objectstorage.ap-singapore-1.oraclecloud.com/n/cn9yc2hk0gzg/b/installation-binary/o/maria%2Fmariadb-5.5.68-linux-systemd-x86_64.tar.gz | tar xvfz -
RUN ln -s mariadb-5.5.68-linux-systemd-x86_64 mysql
RUN chown -R mysql ./mysql; chgrp -R mysql ./mysql

RUN /usr/local/mysql/scripts/mysql_install_db --user=mysql
RUN chown -R root /usr/local/mysql; chown -R mysql /usr/local/mysql/data
WORKDIR /usr/local/mysql/bin
ENV MARIADB_ROOT_PASSWORD=password
COPY setup.sh /usr/local/bin/

CMD [ "/usr/local/mysql/bin/mysqld", "--user=mysql" ]




