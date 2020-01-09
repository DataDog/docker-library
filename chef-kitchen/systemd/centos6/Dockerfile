FROM centos:6
MAINTAINER Karim Bogtob <karim.bogtob@datadoghq.com>

RUN yum install -y epel-release
RUN yum search openssh
RUN yum install -y openssh-server openssh-clients

# This is using the multistage docker build as described here:
# https://docs.docker.com/develop/develop-images/multistage-build/

# the temporary docker-library:chef_kitchen_systemd_scripts_0.1 is described in this repository
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /usr/bin/systemctl /usr/bin/systemctl
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /usr/bin/systemctl /usr/bin/systemd
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /root/start.sh /root/start.sh

CMD [ "/root/start.sh" ]
