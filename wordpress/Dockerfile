FROM debian:bullseye
RUN apt-get update

RUN apt-get update && apt-get install -y mariadb-client curl

RUN apt-get install -y \
    php-cli \
    php-common \
    php-xml \
    php-mbstring \
    php-curl \
    php-zip \
    php-json

WORKDIR /var/www/html

# Download WordPress (consider using a cache layer for efficiency in production)
RUN curl -SL https://wordpress.org/latest.tar.gz | tar -xzf -

# Install wp-cli using Phar archive (alternative to repository installation)
# RUN curl -SL https://raw.githubusercontent.com/wp-client/builds/v2.23.1/wp-cli.phar -o /usr/local/bin/wp
# RUN chmod +x /usr/local/bin/wp


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp --info

# Read environment variables from .env file
ENV $(cat .env)

COPY .env .
RUN wp config create \
  --allow-root \
  --dbname=${DB_NAME} \
  --dbuser=${DB_USER} \
  --dbpass=${DB_PASSWORD} \
  --admin_user=${WP_ADMIN_USER} \
  --admin_password=${WP_ADMIN_PASSWORD} \
  --admin_email=${WP_ADMIN_EMAIL}

# Set ownership of WordPress files (optional, adjust group if needed)
RUN chown -R www-data:www-data .

EXPOSE 9000