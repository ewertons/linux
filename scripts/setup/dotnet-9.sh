#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:dotnet/backports
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-9.0

export DOTNET_ROOT=/usr/share/dotnet
