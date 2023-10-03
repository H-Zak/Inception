FROM debian:bullseye

RUN pat-get update -y && apt-get upgrade -y

RUN apt-get -y install wget
RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp config create	--allow-root \
											--dbname=$SQL_DATABASE \
											--dbuser=$SQL_USER \
											--dbpass=$SQL_PASSWORD \
											--dbhost=mariadb:3306 --path='/var/www/wordpress'

# To create the PID file (/run/php/php7.3-fpm.pid)
RUN mkdir /run/php

# To allow external connections
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# To create index.php  
COPY ./conf/index.php    /var/www/html/wordpress/index.php

# Is optional, just a metadata
EXPOSE 9000 

ENTRYPOINT ["/usr/sbin/php-fpm7.3","-F" ]