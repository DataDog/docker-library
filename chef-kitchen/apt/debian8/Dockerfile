FROM debian:8
MAINTAINER Agent Platform <team-agent-platform@datadoghq.com>

# The Debian Jessie GPG key expired on Sat Nov 19 2022 21:01:13 GMT+0000.
# Use gpgv wrapper that ignores key expiration date but checks package signatures.
COPY gpgvnoexpkeysig /usr/local/sbin
RUN echo 'Dir::Bin::gpg "/usr/local/sbin/gpgvnoexpkeysig";' >> /etc/apt/apt.conf.d/20datadog
