#!/bin/bash

DB_NAME=wordpress
DB_USER=wordpress
DB_PWD=wordpress

echo "CREATE DATABASE"
cat << EOF > db1.sql
CREATE DATABASE IF NOT EXISTS $DB_NAME ;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD' ;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;
ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;  # Consider using a stronger password
FLUSH PRIVILEGES;
EOF

echo "CREATE END"
mariadb -u root -p12345 < db1.sql