FROM debian:bullseye-slim

ARG ANSIBLE_VERSION
RUN test -n "$ANSIBLE_VERSION"

RUN apt-get update \
    && apt-get install -y curl python3 gpg procps python3-apt python3-distutils \
    && apt-get clean

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

# install latest 2.10
RUN python3 -m pip install "ansible==$ANSIBLE_VERSION.*"
