FROM ubuntu:16.04

# Install required packages
RUN apt-get update && \
    apt-get -y install vim net-tools iputils-ping tree && \
    apt-get -y install salt-master && \
    apt-get clean

# Modify console prompt
RUN echo 'export PS1="[\u@salt-master] \w # "' >> /root/.bashrc

# Preconfigure saltstack
COPY saltstack/config/master /etc/salt

# Predefine saltstack /srv directory structure
RUN mkdir -p /srv/salt/ci_jenkins

# Populate saltstack directory structure
COPY saltstack/salt/top.sls /srv/salt/
COPY saltstack/salt/test/init.sls /srv/salt/test/
