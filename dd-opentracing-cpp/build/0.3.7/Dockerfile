FROM ubuntu:20.04

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
  # Common shell utils
  coreutils \
  # Basic circleci utils
  ca-certificates git curl wget tar sudo \
  # Source tools
  clang-format-9 \
  # Build tools
  build-essential cmake clang-9 \
  # Nginx requirements
  libpcre3-dev \
  # Code coverage reporting
  lcov

# This happens after the above steps because apt-key requires gpg already installed
COPY bazel.list /etc/apt/sources.list.d/bazel.list
RUN wget https://bazel.build/bazel-release.pub.gpg
RUN apt-key add bazel-release.pub.gpg && \
  apt-get update && \
  apt-get install -y bazel

