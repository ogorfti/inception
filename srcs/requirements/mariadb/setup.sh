#!/bin/bash

echo "FLUSH PRIVILEGES;" > db.sql
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" >> db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PWD' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PWD' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mariadbd --user=mysql --bootstrap < db.sql

exec "$@"