FROM debian:stable-slim

ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

RUN apt-get update \
    && apt-get install -y curl python gpg procps \
    && apt-get clean
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py
RUN pip install --no-cache-dir snmpsim
RUN groupadd snmpsim && useradd snmpsim -g snmpsim

VOLUME /usr/snmpsim/data
USER snmpsim

ENTRYPOINT ["entrypoint.sh", "--agent-udpv4-endpoint=0.0.0.0:1161"]
