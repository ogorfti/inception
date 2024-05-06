#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[0;33m'
RESET='\033[0m'

if [ -f /var/www/html/wp-config.php ]; then
    printf "${RED}Wordpress is already installed${RESET}\n"
else
    printf "${YELLOW}Setting up Wordpress...${RESET}\n"
    mkdir -p /var/www/html
    cd /var/www/html
    rm -rf *

    # download wordpress core files to the html directory
    wp core download --allow-root

    # create a config file for wordpress to connect to the database
    wp config create --allow-root \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass=$(cat /run/secrets/DB_PASSWORD) \
        --dbhost=$DB_HOST:3306

    # get the data from the secrets
    data=$(cat /run/secrets/CREDENTIALS)
    WP_USER_PWD=$(echo "$data" | grep '^WP_USER_PWD:' | awk -F ': ' '{print $2}')
    WP_ADMIN_PWD=$(echo "$data" | grep '^WP_ADMIN_PWD:' | awk -F ': ' '{print $2}')

    # install wordpress with the config file created
    wp core install --allow-root \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIN_PWD \
        --admin_email=$WP_ADMIN_EMAIL

    # create a user
    wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD --allow-root

    printf "${YELLOW}Wordpress setup completed${RESET}\n"
fi

exec "$@"