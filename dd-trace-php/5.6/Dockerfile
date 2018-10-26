FROM circleci/php:5.6

USER root

RUN apt-get update \
    && apt-get install -y \
        libmemcached-dev \
        valgrind \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-enable pdo \
    && docker-php-ext-enable pdo_mysql \
    && docker-php-source delete \
    && rm -rf /var/lib/apt/lists/*

USER circleci
