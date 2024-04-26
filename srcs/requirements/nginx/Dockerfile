# Notes:
# Dockerfile is blueprint for creating Docker images
# entrypoint / pid 1
# WORKDIR /usr/share/nginx/html

# COPY /html/ .

FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx openssl

RUN openssl req -x509 -sha256 -nodes -days 365 \
    -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt \
    -subj "/C=MA/ST=MARTIL/L=MARTIL/O=42/OU=1337/CN=ogorfti.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"] 