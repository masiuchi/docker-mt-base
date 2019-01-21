FROM php:5.5-apache

RUN docker-php-ext-install pdo_mysql mysqli

RUN apt-get update\
 && apt-get -y install cpanminus libmysql++-dev libssl-dev libxml2-dev libgd-dev netcat --no-install-recommends\
 && apt-get clean\
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /root

RUN curl -O https://raw.githubusercontent.com/movabletype/movabletype/develop/t/cpanfile\
 && cpanm -nq App::cpm\
 && rm -rf .cpanm\
 && cpm install -g Archive::Zip DBI DBD::SQLite\
 && cpm install -g --without-test\
 && rm -rf .perl-cpm

COPY conf/perl-cgi-in-html.conf /etc/apache2/conf-available/

RUN a2enmod cgi\
 && a2enconf perl-cgi-in-html

