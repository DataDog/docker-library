FROM circleci/php:5.6

USER root

RUN apt-get update \
    && apt-get install -y \
        libmemcached-dev \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached \
    && docker-php-source delete \
    && rm -rf /var/lib/apt/lists/*

USER circleci
