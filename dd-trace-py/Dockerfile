# Latest image for this Dockerfile: datadog/docker-library:ddtrace_py
FROM alpine:3.4

RUN apk add --no-cache --update \
            python \
            bash \
            build-base \
            bzip2-dev \
            ca-certificates \
            curl \
            cyrus-sasl-dev \
            git \
            jq \
            libffi-dev \
            libmemcached-dev \
            linux-headers \
            mariadb-dev \
            memcached-dev \
            ncurses-dev \
            openssl \
            openssl-dev \
            patch \
            postgresql-dev=9.5.13-r0 \
            readline-dev \
            sqlite-dev \
            zlib-dev


# Install pyenv
RUN curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | sh
ENV PATH /root/.pyenv/shims:/root/.pyenv/bin:$PATH

# Install all required python versions
RUN pyenv install 2.7.12
RUN pyenv install 3.4.4
RUN pyenv install 3.5.2
RUN pyenv install 3.6.1
RUN pyenv global 2.7.12 3.4.4 3.5.2 3.6.1
RUN pip install --upgrade pip

# Install tox
RUN pip install "tox>=3.3,<4.0"

# Cleaning up apk cache space
RUN rm -rf /var/cache/apk/*
