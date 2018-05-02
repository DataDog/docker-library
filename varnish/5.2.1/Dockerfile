from debian:stretch

RUN apt-get update -y \
    && apt-get install -y \
    apt-transport-https \
    curl \
    gnupg

ADD varnish_5.2.1.pref /etc/apt/preferences.d/
RUN curl -L https://packagecloud.io/varnishcache/varnish52/gpgkey | apt-key add -
RUN echo "deb https://packagecloud.io/varnishcache/varnish52/debian/ stretch main" | tee -a /etc/apt/sources.list.d/varnishcache_varnish52.list

RUN apt-get update -y \
    && apt-get install -y varnish \
    && apt-get clean all

EXPOSE 80

CMD ["varnishd", "-F", "-f", "/etc/varnish/default.vcl"]
