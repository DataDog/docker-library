from debian:stretch

ADD varnish_5.0.0.pref /etc/apt/preferences.d/
RUN apt-get update -y \
    && apt-get install -y apt-transport-https \
    && apt-get install -y \
        varnish \
    && apt-get clean all

EXPOSE 80

CMD ["varnishd", "-F", "-f", "/etc/varnish/default.vcl"]
