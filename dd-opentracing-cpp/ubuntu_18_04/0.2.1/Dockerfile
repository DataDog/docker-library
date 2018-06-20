FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y \
  # Basic circleci utils
  ca-certificates git curl wget tar sudo \
  # Source tools
  clang-format-5.0 \
  # Build tools
  build-essential cmake \
  # Build dependencies
  libpcre3-dev zlib1g-dev libcurl4-openssl-dev libssl-dev \
  # Nginx build dependencies
  libxml2-dev libxslt-dev libgd-dev libgeoip-dev \
  # Packaging tools
  ruby ruby-dev lsb-release \
  # Integration test tools
  jq openjdk-8-jre golang

# For building packages (apt, apk, rpm...)
RUN gem install fpm

# Wiremock for running intergration tests
ADD http://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/2.18.0/wiremock-standalone-2.18.0.jar wiremock-standalone-2.18.0.jar
RUN printf "#!/bin/bash\nset -x\njava -jar $(pwd)/wiremock-standalone-2.18.0.jar \"\$@\"\n" > /usr/local/bin/wiremock && \
  chmod a+x /usr/local/bin/wiremock
