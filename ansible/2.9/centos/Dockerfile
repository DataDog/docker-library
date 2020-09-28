FROM centos:7

RUN yum install -y python3

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

# install latest 2.9
RUN python3 -m pip install "ansible==2.9.*"
