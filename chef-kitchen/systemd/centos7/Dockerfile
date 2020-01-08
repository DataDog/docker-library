FROM centos:7
MAINTAINER Karim Bogtob <karim.bogtob@datadoghq.com>

RUN yum install -y epel-release
RUN yum search openssh
RUN yum install -y openssh-server openssh-clients

COPY scripts/systemctl.py /usr/bin/systemctl
COPY scripts/systemctl.py /usr/bin/systemd
COPY scripts/start.sh /root/start.sh

CMD [ "/root/start.sh" ]
