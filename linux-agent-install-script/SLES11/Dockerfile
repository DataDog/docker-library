FROM opensuse/archive:13.2

RUN echo "VERSION:11" > /etc/SuSE-release

RUN zypper install -y which && zypper addrepo https://ftp5.gwdg.de/pub/opensuse/discontinued/distribution/11.1/repo/oss/ discontinued

RUN zypper install --force -y bash=3.2-141.16

