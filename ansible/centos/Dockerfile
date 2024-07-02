FROM registry.ddbuild.io/images/base:v38221072-2485f17-centos7

ARG ANSIBLE_VERSION
RUN test -n "$ANSIBLE_VERSION"

# Define to fix pip install error for some ansible versions:
# https://github.com/pypa/pip/issues/10219#issuecomment-888127061
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum install -y python3

RUN curl https://bootstrap.pypa.io/pip/3.6/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

# install latest 2.10
RUN python3 -m pip install "ansible==$ANSIBLE_VERSION.*"

# There's a systemctl binary in the image that doesn't seem to work
# correctly (it only returns "Failed to get D-Bus connection: Operation not permitted")
# Since Ansible 2.10, it gets picked up by Ansible, which tries to use it.
# We remove this binary to prevent the CI from failing because of it.
RUN rm -f /usr/bin/systemctl
