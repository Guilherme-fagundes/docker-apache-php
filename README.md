# docker-apache-php

Crie uma pasta com o nome ```  www  ``` para espelhar a pasta ```  /var/www/html  ``` do container

Altere o arquivo ``` docker-compose ``` com as especificaçoes do projeto


### docker-compose.yml

```docker-composee
version: '3.9'

services:
    php:
      build: .
      ports: 
        - 80:80
        - 443:443
      volumes: 
        - ./www:/var/www/html
      links: 
        - db
        
      depends_on: 
        - db      
    db:
      image: mysql:5.7
      expose: 
        - 3306
      ports: 
        - 3306:3306
      volumes: 
        - /var/lib/mysql
      environment: 
        - MYSQL_ROOT_DATABASE=seubanco
        - MYSQL_ROOT_PASSWORD=senhadoseubanco 

 ```

#### Dockerfile

``` Dockerfile FROM php:7.4-apache
RUN apt update && apt upgrade -y
RUN docker-php-ext-install pdo pdo_mysql
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug
EXPOSE 80  
```