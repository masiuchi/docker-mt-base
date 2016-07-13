FROM php:5.5-apache

COPY mt.conf /etc/apache2/sites-available/

RUN a2enmod proxy proxy_http
RUN a2dissite 000-default
RUN a2ensite mt

CMD ["apache2-foreground"]

