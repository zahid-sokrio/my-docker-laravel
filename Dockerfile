FROM php:7.4-fpm

WORKDIR /var/www/html

RUN apt-get update  \
  && apt-get install --quiet --yes --no-install-recommends \
     git \
     unzip \
     libzip-dev \
  && docker-php-ext-install zip pdo pdo_mysql \
  && pecl install -o -f redis-5.1.1\
  && docker-php-ext-enable redis

COPY --from=composer /usr/bin/composer /usr/bin/composer

