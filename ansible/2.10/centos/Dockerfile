FROM centos:7

RUN yum install -y python3

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

# install latest 2.10
RUN python3 -m pip install "ansible==2.10.*"

# There's a systemctl binary in the image that doesn't seem to work
# correctly (it only returns "Failed to get D-Bus connection: Operation not permitted")
# Since Ansible 2.10, it gets picked up by Ansible, which tries to use it.
# We remove this binary to prevent the CI from failing because of it.
RUN rm -f /usr/bin/systemctl
