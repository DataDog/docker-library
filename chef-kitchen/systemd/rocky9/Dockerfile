# Based on https://hub.docker.com/r/eniocarboni/docker-rockylinux-systemd
# Minimal systemd-enabled RockyLinux 9 image

FROM rockylinux:9
LABEL maintainer="Agent Onboarding <team-agentonboarding@datadoghq.com>"

ENV container=docker

COPY start.sh /root/start.sh

# see https://hub.docker.com/_/rockylinux
# RockyLinux:9 missing /usr/sbin/init -> ../lib/systemd/systemd
#  see https://github.com/rocky-linux/sig-cloud-instance-images/issues/39

RUN dnf swap -y curl-minimal curl --allowerasing && dnf clean all

RUN dnf -y install systemd && dnf clean all

RUN cd /lib/systemd/system/sysinit.target.wants/ && \
    for i in *; do \
      if [ "$i" != "systemd-tmpfiles-setup.service" ]; then rm -f "$i"; fi; \
    done && \
    rm -f /lib/systemd/system/multi-user.target.wants/* && \
    rm -f /etc/systemd/system/*.wants/* && \
    rm -f /lib/systemd/system/local-fs.target.wants/* && \
    rm -f /lib/systemd/system/sockets.target.wants/*udev* && \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl* && \
    rm -f /lib/systemd/system/basic.target.wants/* && \
    rm -f /lib/systemd/system/anaconda.target.wants/*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/root/start.sh"]
