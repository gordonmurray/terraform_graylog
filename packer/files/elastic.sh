#!/usr/bin/env bash

set -ex

sudo apt-get update

VERSION=2.4.4

# install elastic 2.4.4 for graylog 2.2 compatability
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/${VERSION}/elasticsearch-${VERSION}.deb

sudo dpkg -i elasticsearch-${VERSION}.deb

sudo systemctl enable elasticsearch.service

sudo systemctl start elasticsearch

sudo service elasticsearch status