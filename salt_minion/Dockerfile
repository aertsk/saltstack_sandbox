FROM ubuntu:16.04

# Install required packages
RUN apt-get update && \
    apt-get -y install salt-minion && \
    apt-get clean

# Modify console prompt
RUN echo 'export PS1="[\u@salt-minion] \w # "' >> /root/.bashrc
