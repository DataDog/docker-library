FROM centos:7

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

# install latest 2.4 (ansible==2.4 will install 2.4.0 and not 2.4.4)
RUN pip install "ansible>=2.4,<2.5"
