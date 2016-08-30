# docker build -f Dockerfile -t qwince/laravel5 .
FROM ubuntu:xenial
MAINTAINER Qwince <info@qwince.com>
# Install packages
RUN apt-get update -y && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install ca-certificates supervisor git curl wget nano --no-install-recommends
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nginx php7.0-mcrypt php7.0-mbstring php7.0-gd nginx php7.0-fpm php7.0-cli php7.0-curl php7.0-mysql --no-install-recommends
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN service nginx start
VOLUME /var/www

ADD webapp/ /var/www/

RUN chown -R www-data.www-data /var/www/*

EXPOSE 80
EXPOSE 443
