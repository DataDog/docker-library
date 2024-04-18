FROM opensuse/leap:15.2

ARG ANSIBLE_VERSION
RUN test -n "$ANSIBLE_VERSION"

# We install tar here to be able to use the image in Github Action (checkout requires tar)
RUN zypper refresh \
    && zypper install -y curl python3 tar gzip

# Install necessary Python version for the controller and use that Python to install Ansible
COPY build_python.sh /
ENV ANSIBLE_PYTHON_PATH="/opt/ansible-python"
RUN zypper install -y gcc automake bzip2 libbz2-devel xz xz-devel openssl-devel \
    zlib-devel libffi-devel make findutils patch \
    && bash build_python.sh
RUN "$ANSIBLE_PYTHON_PATH/bin/python3" -m pip install "ansible==$ANSIBLE_VERSION.*" \
    # We want the ansible executable to be in $PATH but without interfering with system python
    && for f in $ANSIBLE_PYTHON_PATH/bin/ansible-*; do ln -s $f "/usr/bin/$(basename $f)"; done
