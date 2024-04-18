FROM rockylinux:8

ARG ANSIBLE_VERSION
RUN test -n "$ANSIBLE_VERSION"

RUN yum install -y python3

# Install necessary Python version for the controller and use that Python to install Ansible
COPY build_python.sh /
ENV ANSIBLE_PYTHON_PATH="/opt/ansible-python"
RUN yum install -y gcc make patch zlib-devel bzip2 bzip2-devel openssl-devel libffi-devel xz-devel \
    && bash build_python.sh
RUN "$ANSIBLE_PYTHON_PATH/bin/python3" -m pip install "ansible==$ANSIBLE_VERSION.*" \
    # We want the ansible executable to be in $PATH but without interfering with system python
    && for f in $ANSIBLE_PYTHON_PATH/bin/ansible-*; do ln -s $f "/usr/bin/$(basename $f)"; done

# Use the systemctl shim
RUN rm -f /usr/bin/systemctl
RUN ln -s /usr/bin/python3 /usr/bin/python
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /usr/bin/systemctl /usr/bin/systemctl
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /usr/bin/systemctl /usr/bin/systemd
