FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y \
  # Basic circleci utils
  ca-certificates git curl wget tar sudo \
  # Source tools
  clang-format-6.0 \
  # Build tools
  build-essential cmake clang-6.0 \
  # Nginx requirements
  libpcre3-dev

# This happens after the above steps because apt-key requires gpg already installed
COPY bazel.list /etc/apt/sources.list.d/bazel.list
RUN wget https://bazel.build/bazel-release.pub.gpg
RUN apt-key add bazel-release.pub.gpg && \
  apt-get update && \
  apt-get install -y bazel
