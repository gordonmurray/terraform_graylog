#!/usr/bin/env bash

set -ex

sudo apt-get update
sudo apt-get install unzip -y

# mongo
sudo apt install -y mongodb

# verify
sudo systemctl status mongodb
mongo --eval 'db.runCommand({ connectionStatus: 1 })'
