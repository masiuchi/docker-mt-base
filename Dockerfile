FROM perl:5.24

RUN apt-get -y update
RUN apt-get -y install libgd-dev --no-install-recommends\
 && apt-get clean\
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

WORKDIR /root
RUN curl -O https://raw.githubusercontent.com/movabletype/movabletype/master/t/cpanfile\
 &&  perl -i -0pe "s/on 'test' => sub \{.+\};//s" cpanfile
RUN cpanm -nq App::cpm\
 && rm -rf .cpanm
RUN cpm install -g Archive::Zip DBI DBD::SQLite Starlet\
 && cpm install -g\
 && rm -rf .perl-cpm

EXPOSE 3000
WORKDIR /mt
CMD ["start_server", "--port=3000", "--", "plackup", "-s", "Starlet", "--max-workers=2", "--pid-file=/pid/mt.pid", "mt.psgi"]

