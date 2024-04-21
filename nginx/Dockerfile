# Notes:
# Dockerfile is blueprint for creating Docker images
# entrypoint / pid 1

FROM debian

RUN apt-get update && apt-get install -y nginx openssl

RUN openssl req -x509 -sha256 -nodes -days 365 \
    -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"

WORKDIR /usr/share/nginx/html

COPY /html/ .

COPY ./nginx-conf/default.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"] 