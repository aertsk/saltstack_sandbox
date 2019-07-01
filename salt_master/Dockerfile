FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get -y install vim net-tools iputils-ping tree wget gnupg python-pip

# Pin to latest Major saltstack release
RUN wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/2019.2/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/2019.2 bionic main > /etc/apt/sources.list.d/saltstack.list

RUN apt-get update && \
    apt-get -y install salt-master && \
    apt-get clean

RUN pip install docker

# Modify console prompt
RUN echo 'export PS1="[\u@salt-master] \w # "' >> /root/.bashrc

# Preconfigure saltstack
COPY saltstack/config/master /etc/salt

# Populate saltstack directory structure
COPY saltstack/salt/top.sls /srv/salt/

# First experiment
COPY saltstack/salt/test/init.sls /srv/salt/test/

# Second experiment
# https://hub.packtpub.com/docker-container-management-with-saltstack/
COPY saltstack/salt/dock_nginx /srv/salt/dock_nginx
