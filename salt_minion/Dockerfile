FROM ubuntu:18.04

# Install required packages
RUN apt-get update && \
    apt-get -y install wget gnupg

# Pin to latest Major saltstack release
RUN wget -O - https://repo.saltstack.com/py3/ubuntu/18.04/amd64/2019.2/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/2019.2 bionic main > /etc/apt/sources.list.d/saltstack.list

RUN apt-get update && \
    apt-get -y install salt-minion && \
    apt-get clean

# Modify console prompt
RUN echo 'export PS1="[\u@salt-minion] \w # "' >> /root/.bashrc
