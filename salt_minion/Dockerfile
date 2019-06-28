FROM ubuntu:16.04

# Install required packages
RUN apt-get update && \
    apt-get -y install vim net-tools iputils-ping tree && \
    apt-get -y install salt-minion && \
    apt-get -y install python-pip && \
    apt-get clean

RUN pip install docker-py

# Modify console prompt
RUN echo 'export PS1="[\u@salt-minion] \w # "' >> /root/.bashrc
