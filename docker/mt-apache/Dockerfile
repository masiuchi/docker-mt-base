FROM php:5.5-apache

RUN apt-get update
RUN apt-get -y install cpanminus libmysql++-dev libssl-dev libxml2-dev libgd-dev netcat --no-install-recommends\
 && apt-get clean\
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /root
RUN curl -O https://raw.githubusercontent.com/movabletype/movabletype/master/t/cpanfile\
 && perl -i -0pe "s/on 'test' => sub \{.+\};//s" cpanfile
RUN cpanm -nq App::cpm\
 && rm -rf .cpanm
RUN cpm install -g Archive::Zip DBI DBD::SQLite\
 && cpm install -g\
 && rm -rf .perl-cpm

RUN a2enmod cgi

CMD ["apache2-foreground"]

