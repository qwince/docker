# docker build -f Dockerfile -t qwince/laravel5 .
FROM ubuntu:xenial
MAINTAINER Qwince <info@qwince.com>

# Install packages
RUN apt-get update -y && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install ca-certificates supervisor git curl wget nano --no-install-recommends
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install nginx php7.0-mcrypt php7.0-mbstring php7.0-gd nginx php7.0-fpm php7.0-cli php7.0-curl php7.0-mysql --no-install-recommends
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Volume
VOLUME /var/www/webapp

ADD webapp/ /var/www/webapp

RUN chown -R www-data.www-data /var/www/*
RUN chmod 755 -R /var/www/webapp/storage

EXPOSE 80

COPY run_install_laravel.sh /usr/local/bin/run_install_laravel

CMD service php7.0-fpm start && nginx