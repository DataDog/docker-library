FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y curl python \
    && apt-get clean

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

RUN pip install ansible==2.4
