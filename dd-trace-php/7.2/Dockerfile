FROM circleci/php:7.2

USER root

RUN apt-get update \
    && apt-get install -y \
        libmemcached-dev \
        valgrind \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && docker-php-source delete \
    && rm -rf /var/lib/apt/lists/*

USER circleci
