FROM ubuntu:16.04
MAINTAINER greg.meyer@datadoghq.com

RUN apt-get update -qq && \
    apt-get install curl make gcc g++ lbzip2 autoconf automake bison flex g++ git\
    libboost-all-dev libtool make pkg-config ragel libmysqlclient-dev -y

RUN curl -s -L -o /powerdns_recursor-3.7.3.tar.bz2 https://s3.amazonaws.com/dd-agent-tarball-mirror/pdns-recursor-3.7.3.tar.bz2 &&\
    curl -s -L -o /boost_1_55_0.tar.bz2 https://s3.amazonaws.com/dd-agent-tarball-mirror/boost_1_55_0.tar.bz2 &&\
    mkdir -p /pdns &&\
    tar xf /powerdns_recursor-3.7.3.tar.bz2 -C /pdns --strip-components=1 &&\
    tar xf /boost_1_55_0.tar.bz2 -C /pdns --strip-components=1 &&\
    rm /powerdns_recursor-3.7.3.tar.bz2 &&\
    rm /boost_1_55_0.tar.bz2 &&\
    export CPATH=/pnds &&\
    cd /pdns &&\
    ./configure &&\
    make

VOLUME ["/etc/powerdns"]
ADD recursor.conf /etc/powerdns/recursor.conf

EXPOSE 5353/udp
EXPOSE 8082

ENTRYPOINT ["/pdns/pdns_recursor",  "--daemon=no"]
