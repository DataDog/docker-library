FROM debian:oldstable-slim

RUN apt-get update \
    && apt-get install -y curl python gpg procps python-apt \
    && apt-get clean

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

# install latest 2.4 (ansible==2.4 will install 2.4.0 and not 2.4.4)
RUN pip install --no-cache-dir "ansible>=2.4,<2.5"
