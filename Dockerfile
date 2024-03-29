FROM debian:buster

RUN apt update
RUN apt upgrade -y
RUN apt -y install wget nano vim
RUN apt -y install nginx
COPY ./srcs/default /etc/nginx/sites-available

RUN apt -y install mariadb-server
RUN apt -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

WORKDIR /var/www/html/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin
COPY ./srcs/config.inc.php phpmyadmin

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY ./srcs/wp-config.php /var/www/html/wordpress

RUN openssl req -x509 -nodes -days 365 \
-subj "/C=RU/ST=Tatarstan/L=Kazan/O=21School/OU=IT Department/CN=localhost" \
-newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key \
-out /etc/ssl/nginx-selfsigned.crt;

RUN chown -R www-data:www-data *
RUN chmod -R 755 /var/www/*

WORKDIR /
COPY ./srcs/init.sh ./
CMD bash init.sh
