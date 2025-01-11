#!/bin/sh

# check for /run/mysqld  is created 
if [ ! -d "/run/mysqld" ]; then
    mkdir /run/mysqld
fi

# MADB_ROOT_PASSWORD="123"
# MADB_PASSWORD="123"
# MADB_NAME="nabil"
# MADB_USER="bony"

cat << EOF > /tmp/wp.sql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${MADB_NAME};
CREATE USER IF NOT EXISTS '${MADB_USER}'@'%' IDENTIFIED BY '${MADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MADB_NAME}.* TO '${MADB_USER}'@'%' IDENTIFIED BY '${MADB_PASSWORD}';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MADB_ROOT_PASSWORD}';
USE ${MADB_NAME};
CREATE TABLE IF NOT EXISTS test_table (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
INSERT INTO test_table (id, name) VALUES (1, 'test');
EOF

mysqld --user=root --bootstrap < /tmp/wp.sql
exec "$@"