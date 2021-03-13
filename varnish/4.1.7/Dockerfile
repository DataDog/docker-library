from debian:jessie

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
    apt-utils \
    ca-certificates \
    apt-transport-https \
    curl

ADD varnish_4.1.7.pref /etc/apt/preferences.d/
RUN curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
RUN echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1"  | tee -a /etc/apt/sources.list.d/varnish-cache.list
RUN apt-get update \
    && apt-get install -y --no-install-recommends varnish \
    && apt-get clean all

EXPOSE 80

CMD ["varnishd", "-F", "-f", "/etc/varnish/default.vcl"]
