#!/bin/bash
mkdir inception

# project structure
mkdir inception/srcs
mkdir inception/secrets
touch inception/Makefile

# secrets dir
touch inception/secrets/credentials.txt
touch inception/secrets/db_password.txt
touch inception/secrets/db_root_password.txt

# srcs dir
mkdir inception/srcs/requirements
touch inception/srcs/docker-compose.yml
touch inception/srcs/.env

# requirements dir
mkdir inception/srcs/requirements/mariadb
mkdir inception/srcs/requirements/wordpress
mkdir inception/srcs/requirements/nginx

# maria-db service
touch inception/srcs/requirements/mariadb/Dockerfile
touch inception/srcs/requirements/mariadb/.dockerignore
echo ".git" > inception/srcs/requirements/mariadb/.dockerignore
echo ".env" >> inception/srcs/requirements/mariadb/.dockerignore
mkdir inception/srcs/requirements/mariadb/conf
touch inception/srcs/requirements/mariadb/conf/create_db.sh

# nginx service
mkdir inception/srcs/requirements/nginx/conf
touch inception/srcs/requirements/nginx/conf/nginx.conf
touch inception/srcs/requirements/nginx/Dockerfile


# wp service
mkdir inception/srcs/requirements/wordpress/conf
touch inception/srcs/requirements/wordpress/conf/create_wp.sh
touch inception/srcs/requirements/wordpress/Dockerfile
touch inception/srcs/requirements/wordpress/.dockerignore
echo ".git" > inception/srcs/requirements/wordpress/.dockerignore
echo ".env" >> inception/srcs/requirements/wordpress/.dockerignore
