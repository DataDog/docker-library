FROM ubuntu:16.04

# make Apt non-interactive
RUN echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/90circleci \
  && echo 'DPkg::Options "--force-confnew";' >> /etc/apt/apt.conf.d/90circleci

ENV DEBIAN_FRONTEND=noninteractive
# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Use unicode
RUN locale-gen C.UTF-8 || true
ENV LANG=C.UTF-8
ENV DOCKERIZE_URL="https://circle-downloads.s3.amazonaws.com/circleci-images/cache/linux-amd64/dockerize-latest.tar.gz" 

RUN set -xe; \
  apt-get update; \ 
  apt-get install software-properties-common python-software-properties; \
  add-apt-repository ppa:ondrej/php; \
  apt-get install make gcc locales sudo git vim netcat curl;\
  apt-get clean; rm -rf /var/lib/apt/lists/*; \
  \
  mkdir -p /usr/local/etc/php/conf.d; \
  \
  groupadd --gid 3434 circleci; \
  useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci; \
  \
  echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci; \
  echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep; \
  \
  curl --silent --show-error --location --fail --retry 3 --output /tmp/dockerize-linux-amd64.tar.gz $DOCKERIZE_URL; \
  tar -C /usr/local/bin -xzvf /tmp/dockerize-linux-amd64.tar.gz; \
  rm -rf /tmp/dockerize-linux-amd64.tar.gz; \
  dockerize --version;

ARG PHP_VERSION=7.2  
RUN set -xe; \  
  apt-get update; \
  apt-get install php${PHP_VERSION} php${PHP_VERSION}-cli php${PHP_VERSION}-common \
    php${PHP_VERSION}-dev php${PHP_VERSION}-curl php${PHP_VERSION}-curl \
    php${PHP_VERSION}-mysql php${PHP_VERSION}-opcache php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom php${PHP_VERSION}-memcached php${PHP_VERSION}-zip \
    ; \
  ln -s /usr/local/etc/php/conf.d/ddtrace.ini /etc/php/${PHP_VERSION}/cli/conf.d/99-ddtrace.ini; \
  apt-get clean; rm -rf /var/lib/apt/lists/*

RUN set -xe; \
  php -r "copy('https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer', 'composer-setup.php');"; \
  php composer-setup.php; \
  php -r "unlink('composer-setup.php');"; \
  mv composer.phar /usr/local/bin/composer;
