FROM opensuse/leap:15.2

ARG ANSIBLE_VERSION
RUN test -n "$ANSIBLE_VERSION"

RUN zypper refresh \
    && zypper install -y curl python3

RUN curl https://bootstrap.pypa.io/pip/3.6/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

# install latest 2.10
RUN python3 -m pip install "ansible==$ANSIBLE_VERSION.*"
