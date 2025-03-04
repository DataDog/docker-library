# Based on https://hub.docker.com/r/trfore/docker-centos9-systemd
# Minimal systemd-enabled CentOS Stream 9 image

FROM quay.io/centos/centos:stream9
LABEL maintainer="Agent Onboarding <team-agentonboarding@datadoghq.com>"

ENV container=docker

RUN yum -y update \
    && yum -y install \
    epel-release \
    hostname \
    initscripts \
    iproute \
    openssl \
    sudo \
    which \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && yum clean all

# selectively remove systemd targets -- See https://hub.docker.com/_/centos/
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

STOPSIGNAL SIGRTMIN+3

VOLUME ["/sys/fs/cgroup"]

COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.2 /root/start.sh /root/start.sh

CMD ["/root/start.sh"]
