FROM perl:5.24

RUN apt-get -y update\
 && apt-get -y install libgd-dev netcat --no-install-recommends\
 && apt-get clean\
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /root

RUN curl -O https://raw.githubusercontent.com/movabletype/movabletype/develop/t/cpanfile\
 && cpanm -nq App::cpm\
 && rm -rf .cpanm\
 && cpm install -g Archive::Zip DBI DBD::SQLite Starlet Server::Starter\
 && cpm install -g --without-test\
 && rm -rf .perl-cpm

RUN rm /usr/bin/perl\
 && ln -s /usr/local/bin/perl /usr/bin/perl

COPY docker-entrypoint.sh /root/
COPY mt-config.cgi.default /root/

EXPOSE 3000
WORKDIR /mt
ENTRYPOINT ["/root/docker-entrypoint.sh"]
CMD ["start_server", "--port=3000", "--pid-file=mt.pid", "--", "plackup", "-s", "Startlet", "--max-workers=2", "mt.psgi"]
