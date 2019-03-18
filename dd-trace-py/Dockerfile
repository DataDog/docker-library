# Latest image for this Dockerfile: datadog/docker-library:ddtrace_py

# DEV: Use `python:slim` instead of an `alpine` image to support installing wheels from PyPI
#      this drastically improves test execution time since python dependencies don't all
#      have to be built from source all the time (grpcio takes forever to install)
FROM python:slim

RUN \
  # Install system dependencies
  apt-get update \
  && apt-get install -y --no-install-recommends \
      build-essential \
      ca-certificates \
      curl \
      git \
      jq \
      libbz2-dev \
      libffi-dev \
      libmariadb-dev \
      libmemcached-dev \
      libmemcached-dev \
      libncurses5 \
      libpq-dev \
      libreadline-dev \
      libsasl2-dev \
      libsqlite3-dev \
      libssh-dev \
      patch \
      zlib1g-dev \
  # Cleaning up apt cache space
  && rm -rf /var/lib/apt/lists/*


# Configure PATH environment for pyenv
ENV PYENV_ROOT /root/.pyenv
ENV PATH ${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:$PATH

# Install pyenv
RUN git clone git://github.com/yyuu/pyenv.git "${PYENV_ROOT}"

# Install all required python versions
RUN \
  pyenv install 2.7.15 \
  && pyenv install 3.4.9 \
  && pyenv install 3.5.6 \
  && pyenv install 3.6.8 \
  && pyenv install 3.7.2 \
  && pyenv global 2.7.15 3.4.9 3.5.6 3.6.8 3.7.2 \
  && pip install --upgrade pip

# Install Python dependencies
# DEV: `tox==3.7` introduced parallel execution mode
#      https://tox.readthedocs.io/en/3.7.0/example/basic.html#parallel-mode
RUN pip install "tox>=3.7,<4.0"

CMD ["/bin/bash"]
