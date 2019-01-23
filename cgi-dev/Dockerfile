FROM masiuchi/docker-mt-base:cgi

RUN apt-get update\
 && apt-get -y install bzip2\
 && apt-get clean\
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*\
 && curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2\
 && tar jxf phantomjs-1.9.8-linux-x86_64.tar.bz2\
 && cp phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/\
 && rm -rf phantomjs-1.9.8-linux-x86_64*\
 && cpm install -g\
 && rm -rf .perl-cpm

WORKDIR /var/www/html/mt

