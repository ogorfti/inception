FROM debian:bookworm

RUN apt-get update -y

RUN apt-get install -y \
    php8.2 \
    php8.2-fpm \
    php8.2-xml \
    php8.2-mbstring \
    php8.2-curl \
    php8.2-gd \
    php8.2-mysql \
    mariadb-client \
    sendmail \
    wget \
    unzip

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

EXPOSE 9000

COPY conf/setup.sh /
RUN chmod +x /setup.sh

ENTRYPOINT ["sh", "/setup.sh"]

CMD ["php-fpm8.2", "-F"]