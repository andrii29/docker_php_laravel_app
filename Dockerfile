FROM nginx

MAINTAINER Test Compny Inc.

RUN apt-get update
RUN apt-get install -y  php7.0 php7.0-fpm  php7.0-mysql php7.0-cli php7.0-curl php7.0-gd php7.0-mbstring curl wget git zip unzip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY site.conf /etc/nginx/conf.d/


CMD service php7.0-fpm start && nginx -g "daemon off;"
