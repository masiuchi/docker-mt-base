FROM centos:centos6

MAINTAINER Masahiro Iuchi <masahiro.iuchi@gmail.com>

RUN yum clean all
RUN yum -y update

RUN yum -y install httpd

RUN yum -y install mysql mysql-server

#### Perl
RUN yum -y install perl perl-core

# For installing XSS modules.
RUN yum -y install gcc

# For installing Net::SSLeay
RUN yum -y install openssl-devel

# Install GD from RPM.
RUN yum -y install perl-GD

# Install Image::Magick from RPM.
RUN yum -y install ImageMagick-perl

# For installing Math::GMP.
RUN yum -y install gmp-devel

# For installing XML::Parser.
RUN yum -y install expat-devel

# For installing XML::LibXML.
RUN yum -y install libxml2-devel

# TODO: should use https.
RUN curl -L http://cpanmin.us | perl - App::cpanminus
COPY ./cpanfile /tmp/
RUN cpanm --installdeps . --cpanfile /tmp/cpanfile

RUN yum clean all
RUN rm /tmp/cpanfile
