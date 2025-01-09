FROM debian:stable

RUN apt-get update && apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client

# RUN useradd -r -m mysql && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld


EXPOSE 3306

HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

CMD ["mysqld","--user=root"]