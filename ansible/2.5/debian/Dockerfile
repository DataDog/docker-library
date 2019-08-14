FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y curl python gpg procps python-apt \
    && apt-get clean

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

# install latest 2.5 (ansible==2.5 will install 2.5.0 and not 2.5.5)
RUN pip install "ansible>=2.5,<2.6"
