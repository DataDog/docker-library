FROM circleci/php:7.2

USER root

RUN apt-get update \
    && apt-get install -y \
        libmemcached-dev \
        valgrind \
        libmcrypt-dev \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && pecl install memcached \
    && pecl install mcrypt-1.0.1 \
    && docker-php-ext-enable memcached \
    && docker-php-ext-install mysqli pdo pdo_mysql pcntl \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-enable pdo \
    && docker-php-ext-enable pdo_mysql \
    && docker-php-ext-enable pcntl \
    && docker-php-ext-enable mcrypt \
    && docker-php-source delete \
    && rm -rf /var/lib/apt/lists/*

USER circleci
