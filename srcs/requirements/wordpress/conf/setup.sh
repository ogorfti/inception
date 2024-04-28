#!/bin/bash


# check if wordpress is already installed
if [ -f /var/www/html/wp-config.php ]; then
    echo "Wordpress is already installed"
else
    echo "Setting up Wordpress..."

    mkdir -p /var/www/html
    cd /var/www/html
    rm -rf *

    pwd
    php -v

    wp core download --allow-root

    echo -e "\e[32mWordpress downloaded $DB_NAME\e[0m"

    wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$DB_PWD \
        --dbhost=$DB_HOST:3306

    echo -e "\e[32mWordpress config created\e[0m"

    wp core install --allow-root \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIN_PWD \
        --admin_email=$WP_ADMIN_EMAIL

    #create a user
    # wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PWD --allow-root

    sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf
    mkdir -p /run/php

    chown -R www-data:www-data /var/www/html/
    chmod -R 777 /var/www/html/

    echo -e "\e[32mWordpress installed\e[0m"
fi

exec "$@"
