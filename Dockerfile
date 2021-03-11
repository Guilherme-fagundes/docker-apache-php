FROM php:7.4-apache
RUN apt update && apt upgrade -y
RUN docker-php-ext-install pdo pdo_mysql
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug
EXPOSE 80


