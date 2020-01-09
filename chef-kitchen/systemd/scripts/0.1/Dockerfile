FROM scratch
MAINTAINER Karim Bogtob <karim.bogtob@datadoghq.com>

# The goal of this image is to be useful as a multistage docker image build
COPY systemctl.py /usr/bin/systemctl
COPY systemctl.py /usr/bin/systemd
COPY start.sh /root/start.sh

CMD [ "/root/start.sh" ]
