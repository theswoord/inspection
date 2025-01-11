FROM debian:stable

RUN apt-get update && \
    apt-get install -y wget lsb-release gnupg2 && \
    apt-get install -y software-properties-common

RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list && \
    apt-get update && \
    apt-get install -y php8.1-fpm

RUN wget https://wordpress.org/latest.tar.gz -P /var/www/

RUN cd /var/www/ && tar -xzvf latest.tar.gz 

# CMD [ "/usr/bin/php-fpm8.1","-F" ]
# CMD [ "bash" ]
EXPOSE 9000
CMD ["php-fpm8.1", "-F"]
