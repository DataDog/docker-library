FROM opensuse/leap:15
LABEL maintainer="Agent Platform <team-agent-platform@datadoghq.com>"

RUN zypper install -y \
    openssh \
    python=2.7.17 \
    ruby=2.5

# This is using the multistage docker build as described here:
# https://docs.docker.com/develop/develop-images/multistage-build/

# the temporary docker-library:chef_kitchen_systemd_scripts_0.1 is described in this repository
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /usr/bin/systemctl /usr/bin/systemctl
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /usr/bin/systemctl /usr/bin/systemd
COPY --from=datadog/docker-library:chef_kitchen_systemd_scripts_0.1 /root/start.sh /root/start.sh

CMD [ "/root/start.sh" ]
