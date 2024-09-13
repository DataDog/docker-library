FROM amazonlinux:2023

ARG ANSIBLE_VERSION
RUN test -n "$ANSIBLE_VERSION"

# Define to fix pip install error for some ansible versions:
# https://github.com/pypa/pip/issues/10219#issuecomment-888127061
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Agent < 7.35 doesn't have "Requires(pre): shadow-utils"
# We install tar here to be able to use the image in Github Action (checkout requires tar)
RUN yum install -y python3 shadow-utils tar

RUN curl https://bootstrap.pypa.io/pip/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

RUN python3 -m pip install "ansible==$ANSIBLE_VERSION.*"
