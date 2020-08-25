FROM centos:7

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

# install latest 2.8 (ansible==2.8 will install 2.8.0 and not the latest 2.6.8)
RUN pip install --no-cache-dir "ansible>=2.8,<2.9"
