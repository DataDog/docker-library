FROM ubuntu:16.04
MAINTAINER greg.meyer@datadoghq.com

RUN apt-get update && \
    apt-get install curl -y

RUN echo "deb [arch=amd64] http://repo.powerdns.com/ubuntu xenial-rec-40 main" | tee /etc/apt/sources.list.d/pdns.list && \
    echo "Package: pdns-*\nPin: origin repo.powerdns.com\nPin-Priority: 600" | tee /etc/apt/preferences.d/pdns && \
    curl https://repo.powerdns.com/FD380FBB-pub.asc | apt-key add -

RUN apt-get update && \
    apt-get install pdns-recursor=4.0.9-1pdns.xenial -y

VOLUME ["/etc/powerdns"]
ADD recursor.conf /etc/powerdns/recursor.conf

EXPOSE 5353/udp
EXPOSE 8082
ENTRYPOINT ["/usr/sbin/pdns_recursor", "--daemon=no"]
