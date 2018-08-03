FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y \
  # Basic circleci utils
  ca-certificates git curl wget tar sudo \
  # Integration test tools
  lsb-release jq openjdk-8-jre golang

# Wiremock for running intergration tests
ADD http://repo1.maven.org/maven2/com/github/tomakehurst/wiremock-standalone/2.18.0/wiremock-standalone-2.18.0.jar wiremock-standalone-2.18.0.jar
RUN printf "#!/bin/bash\nset -x\njava -jar $(pwd)/wiremock-standalone-2.18.0.jar \"\$@\"\n" > /usr/local/bin/wiremock && \
  chmod a+x /usr/local/bin/wiremock
