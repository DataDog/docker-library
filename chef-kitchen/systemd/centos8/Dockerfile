FROM centos:8
MAINTAINER Agent Platform <team-agent-platform@datadoghq.com>

RUN yum install -y epel-release
RUN yum search openssh
RUN yum install -y openssh-server openssh-clients
RUN yum install -y ruby-2.5.5
RUN yum install -y python2-2.7.16
# binding python2 as default python interpreter for fake systemctl
RUN ln -s /usr/bin/python2 /usr/bin/python

# This is using the multistage docker build as described here:
# https://docs.docker.com/develop/develop-images/multistage-build/

# the temporary docker-library:chef_kitchen_systemd_scripts_0.1 is described in this repository
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /usr/bin/systemctl /usr/bin/systemctl
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /usr/bin/systemctl /usr/bin/systemd
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /root/start.sh /root/start.sh

CMD [ "/root/start.sh" ]
