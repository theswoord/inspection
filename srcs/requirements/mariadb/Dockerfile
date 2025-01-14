FROM debian:stable

RUN apt-get update && apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client


RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
COPY ./tools/script.sh  /usr/local/bin/script.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306

HEALTHCHECK --start-period=10s \
CMD mariadb -e 'SELECT @@datadir;' || exit 1
ENTRYPOINT [ "bash","/usr/local/bin/script.sh" ]
CMD ["mysqld","--user=root"]