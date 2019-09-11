FROM openjdk:8-jre

ENV DRUID_HOME=/usr/local/druid
ENV DRUID_VERSION=0.15.0-incubating

# perl needed for running some druid scripts
RUN apt-get update \
    && apt-get install -y perl \
    && apt-get clean all

RUN mkdir -p $DRUID_HOME \
    && curl "https://archive.apache.org/dist/incubator/druid/$DRUID_VERSION/apache-druid-$DRUID_VERSION-bin.tar.gz" \
    | tar zxf - --strip-components 1 -C $DRUID_HOME

COPY ./conf /opt/druid_conf

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

WORKDIR $DRUID_HOME

ENTRYPOINT ["/docker-entrypoint.sh"]
