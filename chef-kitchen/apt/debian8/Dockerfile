FROM debian:8
LABEL maintainer="Agent Platform <team-agent-platform@datadoghq.com>"

# The Debian Jessie GPG key expired on Sat Nov 19 2022 21:01:13 GMT+0000.
# Use gpgv wrapper that ignores key expiration date but checks package signatures.
COPY gpgvnoexpkeysig /usr/local/sbin
RUN echo 'Dir::Bin::gpg "/usr/local/sbin/gpgvnoexpkeysig";' >> /etc/apt/apt.conf.d/20datadog
# Jessie is no more on mirror network, we must use archived sources
RUN echo 'Acquire::Check-Valid-Until "false";' >> /etc/apt/apt.conf.d/99custom
RUN rm /etc/apt/sources.list
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian-security jessie/updates main" >> /etc/apt/sources.list.d/jessie.list
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian-archive/debian jessie main" >> /etc/apt/sources.list.d/jessie.list
