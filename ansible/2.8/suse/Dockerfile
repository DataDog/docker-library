FROM opensuse/leap:15.2

RUN zypper refresh \
    && zypper install -y curl python3

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

# install latest 2.8
RUN python3 -m pip install "ansible==2.8.*"
