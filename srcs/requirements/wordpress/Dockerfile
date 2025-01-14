FROM debian:stable


RUN apt-get update && \
    apt-get install -y wget lsb-release gnupg2 && \
    apt-get install -y software-properties-common && \
    apt-get install -y curl

RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get install -y php8.1-fpm && \
    apt-get install -y php8.1-mysql && \ 
    apt-get install -y php8.1-cli && \
    apt-get install -y php-mysql && \ 
    apt-get install -y mariadb-client




# RUN apt-get update && apt-get install -y sendmail 


RUN wget https://wordpress.org/latest.tar.gz -P /var/www/
RUN      chown  root:root /var/www/latest.tar.gz
RUN      chmod  777  /var/www/latest.tar.gz

RUN cd /var/www/ && tar -xzvf latest.tar.gz 
RUN      chown -R root:root /var/www/wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && mv /wp-cli.phar /bin/wp && chmod +x /bin/wp
COPY ./tools/config.sh /var/www/wordpress
RUN chown root:root /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh
COPY ./conf/www.conf /etc/php/8.1/fpm/pool.d/www.conf

RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 777 /var/www/wordpress

EXPOSE 9000
WORKDIR /var/www/wordpress
ENTRYPOINT ["bash", "config.sh"]

CMD ["php-fpm8.1", "-F"]
