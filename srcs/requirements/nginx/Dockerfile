FROM debian:stable

RUN apt-get update && apt-get install nginx -y

EXPOSE 443

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/nbouhali.com.crt  /etc/nginx/ssl/nbouhali.com.crt
COPY ./tools/nbouhali.com.key /etc/nginx/ssl/nbouhali.com.key
COPY ./tools/index.html /var/www/html/index.html
# CMD 


CMD ["nginx", "-g", "daemon off;"]

