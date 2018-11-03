#!/usr/bin/env bash

set -ex

sudo apt-get update

# Installing the Oracle JDK
sudo add-apt-repository ppa:webupd8team/java
sudo apt update

# auto accept
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# install 
sudo apt install oracle-java8-installer -y