FROM debian:bookworm

RUN apt-get update
RUN apt-get install -y mariadb-server


RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

COPY conf/setup.sh /
RUN chmod +x /setup.sh

EXPOSE 3306

ENTRYPOINT [ "/setup.sh" ]
CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]