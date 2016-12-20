FROM ubuntu:16.04
MAINTAINER greg.meyer@datadoghq.com

RUN apt-get update && \
    apt-get install pdns-recursor -y

VOLUME ["/etc/powerdns"]
ADD recursor.conf /etc/powerdns/recursor.conf

EXPOSE 5353/udp
EXPOSE 8082
ENTRYPOINT ["/usr/sbin/pdns_recursor", "--daemon=no"]
