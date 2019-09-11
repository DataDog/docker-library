FROM openjdk:8-jre-alpine

ENV DRUID_HOME=/usr/local/druid
ENV DRUID_VERSION=0.15.0-incubating

RUN apk add --update --no-cache bash

RUN apk add --no-cache --virtual curl \
    && mkdir -p $DRUID_HOME \
    && curl "https://archive.apache.org/dist/incubator/druid/$DRUID_VERSION/apache-druid-$DRUID_VERSION-bin.tar.gz" \
        | tar zxf - --strip-components 1 -C $DRUID_HOME \
    && apk del curl

COPY ./conf /opt/druid_conf

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

WORKDIR $DRUID_HOME

ENTRYPOINT ["/docker-entrypoint.sh"]
