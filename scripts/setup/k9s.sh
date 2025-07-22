#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y wget tar

mkdir k9s_install && cd k9s_install
wget https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz
tar -xvzf ./k9s_Linux_amd64.tar.gz
sudo mv k9s /usr/local/bin/
cd ..
rm -rf k9s_install/

