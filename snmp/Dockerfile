FROM python:alpine

RUN apk add --no-cache gcc libc-dev && \
    addgroup -S snmpsim && \
    adduser -S snmpsim -G snmpsim && \
    pip install --no-cache-dir snmpsim

ADD entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh", "--agent-udpv4-endpoint=0.0.0.0:1161", "--process-user=snmpsim", "--process-group=snmpsim"]
