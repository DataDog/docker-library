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

RUN set -xe; \
  apt-get update; \ 
  apt-get install software-properties-common python-software-properties; \
  add-apt-repository -y ppa:ondrej/php; \
  apt-get -y clean; rm -rf /var/lib/apt/lists/*  

ARG PHP_VERSION=7.2  
RUN set -xe; \  
  apt-get update; \
  apt-get -y install php${PHP_VERSION} php${PHP_VERSION}-cli php${PHP_VERSION}-common; \
  apt-get -y clean; rm -rf /var/lib/apt/lists/*  
