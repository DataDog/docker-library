# Latest image for this Dockerfile: datadog/docker-library:ddtrace_py
FROM alpine:3.4

RUN \
  # Install system dependencies
  apk add --no-cache --update \
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
      zlib-dev \
  # Cleaning up apk cache space
  && rm -rf /var/cache/apk/*

# Install pyenv
RUN curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | sh
# Configure PATH environment for pyenv
ENV PATH /root/.pyenv/shims:/root/.pyenv/bin:$PATH

# Install all required python versions
RUN \
  pyenv install 2.7.15 \
  && pyenv install 3.4.9 \
  && pyenv install 3.5.6 \
  && pyenv install 3.6.7 \
  && pyenv install 3.7.1 \
  && pyenv global 2.7.15 3.4.9 3.5.6 3.6.7 3.7.1 \
  && pip install --upgrade pip

# Install Python dependencies
RUN pip install "tox>=3.3,<4.0" "detox>=0.18<1.0"
