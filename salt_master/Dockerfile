FROM ubuntu:16.04

# Install required packages
RUN apt-get update && \
    apt-get -y install vim net-tools iputils-ping && \
    apt-get -y install salt-master && \
    apt-get clean

# Modify console prompt
RUN echo 'export PS1="[\u@salt-master] \w # "' >> /root/.bashrc

# Preconfigure saltstack
COPY saltstack/config/master /etc/salt

# Predefine saltstack data
RUN mkdir -p /srv/salt_master
COPY saltstack/data/*.sls /srv/salt/
