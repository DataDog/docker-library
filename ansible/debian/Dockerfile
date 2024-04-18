FROM debian:bullseye-slim

ARG ANSIBLE_VERSION
RUN test -n "$ANSIBLE_VERSION"

RUN apt-get update \
    && apt-get install -y curl python3 gpg procps python3-apt python3-distutils git openssh-client\
    && apt-get clean

# Install necessary Python version for the controller and use that Python to install Ansible
COPY build_python.sh /
ENV ANSIBLE_PYTHON_PATH="/opt/ansible-python"
RUN apt-get install -y build-essential libssl-dev zlib1g-dev \
    libbz2-dev xz-utils libffi-dev liblzma-dev \
    && bash build_python.sh
RUN "$ANSIBLE_PYTHON_PATH/bin/python3" -m pip install "ansible==$ANSIBLE_VERSION.*" \
    # We want the ansible executable to be in $PATH but without interfering with system python
    && for f in $ANSIBLE_PYTHON_PATH/bin/ansible-*; do ln -s $f "/usr/bin/$(basename $f)"; done
