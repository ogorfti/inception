FROM debian:bookworm

RUN apt-get update
RUN apt-get install -y mariadb-server \
    mariadb-client \
# vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# RUN chmod 
COPY ./conf/script.sh /
RUN chmod +x /script.sh

EXPOSE 3306

CMD ["/script.sh"]