FROM debian:stretch-slim

RUN printf 'deb http://archive.debian.org/debian stretch main\ndeb http://archive.debian.org/debian-security stretch/updates main' > /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y curl python gpg procps python-apt \
    && apt-get clean

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

# install latest 2.7 (ansible==2.7 will install 2.7.0 and not the latest 2.7.X)
RUN pip install "ansible>=2.7,<2.8"
