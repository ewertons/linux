#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y wget unzip

wget https://github.com/Azure/kubelogin/releases/download/v0.2.9/kubelogin-linux-amd64.zip
unzip ./kubelogin-linux-amd64.zip
sudo install -o root -g root -m 0755 ./bin/linux_amd64/kubelogin /usr/bin/kubelogin
rm kubelogin-linux-amd64.zip
rm -rf ./bin

