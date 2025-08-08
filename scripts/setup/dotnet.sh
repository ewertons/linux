#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y \
    libc6 \
    libgcc1 \
    libgssapi-krb5-2 \
    libicu74 \
    libssl3 \
    libstdc++6 \
    zlib1g

wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --version 9
rm ./dotnet-install.sh

