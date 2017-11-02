FROM perl:5.24

RUN apt-get -y update
RUN apt-get -y install libgd-dev netcat --no-install-recommends\
 && apt-get clean\
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /root
RUN curl -O https://raw.githubusercontent.com/movabletype/movabletype/master/t/cpanfile
RUN cpanm -nq App::cpm\
 && rm -rf .cpanm
RUN cpm install -g Archive::Zip DBI DBD::SQLite Starlet\
 && cpm install -g --without-test\
 && rm -rf .perl-cpm

COPY start.sh /

EXPOSE 3000
WORKDIR /app/movabletype
CMD ["bash", "/start.sh"]

