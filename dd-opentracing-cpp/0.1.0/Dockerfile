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
    ruby ruby-dev lsb-release

