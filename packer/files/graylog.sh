#!/usr/bin/env bash

set -ex

sudo apt-get update
sudo apt install pwgen -y 

# user
adduser graylog
usermod -aG sudo graylog

# install graylog 2.2 
wget https://packages.graylog2.org/repo/packages/graylog-2.2-repository_latest.deb
sudo dpkg -i graylog-2.2-repository_latest.deb
sudo apt-get update
sudo apt-get install graylog-server -y
sudo systemctl enable graylog-server.service

# generate password for graylog
sudo -E sed -i -e "s/password_secret =.*/password_secret = $(pwgen -s 128 1)/" /etc/graylog/server/server.conf

# set the root_password_sha2 value
sudo sed -i -e "s/root_password_sha2 =.*/root_password_sha2 = $(echo -n 'password' | shasum -a 256 | cut -d' ' -f1)/" /etc/graylog/server/server.conf

