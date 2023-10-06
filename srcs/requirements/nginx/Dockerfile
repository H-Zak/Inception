FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt-get install nginx -y

RUN apt-get install vim -y    

RUN apt-get install curl -y

RUN mkdir -p /etc/nginx/ssl

RUN apt-get install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=zhamdouc.42.fr/UID=zhamdouc"

RUN mkdir -p /var/run/nginx

# COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]