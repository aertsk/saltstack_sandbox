#!/bin/bash

# Remove all doker images 
docker image prune -f -a

# Remove Docker 
apt -y purge docker.io
rm -rf /etc/docker/

# Remove docker pip module
pip uninstall -y docker

# Remove python-pip
apt -y purge python3-pip

# Remove salt-minion auth key
rm /etc/salt/pki/minion/*
service salt-minion restart

