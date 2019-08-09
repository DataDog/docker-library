FROM centos:7

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

# install latest 2.7 (ansible==2.7 will install 2.7.0 and not the latest 2.7.X)
RUN pip install "ansible>=2.7,<2.8"
