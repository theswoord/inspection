FROM debian:stable

RUN apt-get update && apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client

# ENV MADB_NAME = 7mida \


# ENV key=value
# ENV MADB_ROOT_PASSWORD="123"\
#     MADB_PASSWORD="123"\
#     MADB_NAME="nabil"\
#     MADB_USER="bony"


# RUN useradd -r -m mysql && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
COPY ./tools/script.sh  /usr/local/bin/script.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306

HEALTHCHECK --start-period=5m \
CMD mariadb -e 'SELECT @@datadir;' || exit 1
ENTRYPOINT [ "bash","/usr/local/bin/script.sh" ]
CMD ["mysqld","--user=root"]