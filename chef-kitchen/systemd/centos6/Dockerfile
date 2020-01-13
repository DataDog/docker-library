FROM centos:6
MAINTAINER Karim Bogtob <karim.bogtob@datadoghq.com>

# Install python building dependencies
RUN yum -y update && \
    yum groupinstall -y development && \
    yum install -y \
    bzip2-devel \
    git \
    hostname \
    openssl \
    openssl-devel \
    sqlite-devel \
    sudo \
    tar \
    wget \
    zlib-dev

# Install python2.7
RUN cd /tmp && \
    wget https://www.python.org/ftp/python/2.7.8/Python-2.7.8.tgz && \
    tar xvfz Python-2.7.8.tgz && \
    cd Python-2.7.8 && \
    ./configure --prefix=/usr/local && \
    make && \
    make altinstall

RUN ln -s /usr/local/bin/python2.7 /usr/local/bin/python

RUN yum install -y openssh-server openssh-clients

# This is using the multistage docker build as described here:
# https://docs.docker.com/develop/develop-images/multistage-build/

# the temporary docker-library:chef_kitchen_systemd_scripts_0.1 is described in this repository
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /usr/bin/systemctl /usr/bin/systemctl
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /usr/bin/systemctl /usr/bin/systemd
# replace shebang to use correct version of python
RUN sed -i 's|#! /usr/bin/python|#! /usr/local/bin/python|g' /usr/bin/systemctl
run sed -i 's|#! /usr/bin/python|#! /usr/local/bin/python|g' /usr/bin/systemd
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /root/start.sh /root/start.sh

CMD [ "/root/start.sh" ]
