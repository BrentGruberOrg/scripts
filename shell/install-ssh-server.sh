#!/bin/sh

# INSTALL openssh-server
sudo apt-get upgrade
sudo apt-get install -y openssh-server

# ENABLE openssh-server as a service
sudo systemctl enable ssh --now
