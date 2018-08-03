FROM ubuntu:18.04

RUN apt-get update && \
  apt-get install -y \
  # Basic circleci utils
  ca-certificates git curl wget tar sudo \
  # Source tools
  clang-format-5.0 \
  # Build tools
  build-essential cmake

