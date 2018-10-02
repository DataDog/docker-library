FROM debian:stable-slim

RUN apt-get update \
    && apt-get install -y curl python gpg procps \
    && apt-get clean
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py
RUN pip install snmpsim
RUN groupadd snmpsim && useradd snmpsim -g snmpsim

VOLUME /usr/snmpsim/data

ENTRYPOINT ["snmpsimd.py", "--agent-udpv4-endpoint=0.0.0.0:1161", "--process-user=snmpsim", "--process-group=snmpsim"]
