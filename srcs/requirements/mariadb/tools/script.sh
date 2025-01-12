#!/bin/sh

# check for /run/mysqld  is created 
if [ ! -d "/run/mysqld" ]; then
    mkdir /run/mysqld
fi

# MADB_ROOT_PASSWORD=$MADB_ROOT_PASSWORD
# MADB_PASSWORD=$
cat << EOF > /tmp/wp.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${MADB_NAME};
CREATE USER IF NOT EXISTS '${MADB_USER}'@'%' IDENTIFIED BY '${MADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MADB_NAME}.* TO '${MADB_USER}'@'%' IDENTIFIED BY '${MADB_PASSWORD}';
FLUSH PRIVILEGES;
EOF

mysqld --user=root --bootstrap < /tmp/wp.sql
exec "$@"