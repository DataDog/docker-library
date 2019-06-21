FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y curl python gpg procps \
    && apt-get clean

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

# install latest 2.8
RUN pip install "ansible<2.9"
