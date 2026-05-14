#!/bin/bash

set -e

required_cmake="3.20.0"

if ! command -v cmake >/dev/null 2>&1; then
  echo "cmake >= $required_cmake is required (found: none)"
  exit 1
fi

cmake_version=$(cmake --version 2>/dev/null | head -1 | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')
if [ -z "$cmake_version" ] || [ "$(printf '%s\n' "$required_cmake" "$cmake_version" | sort -V | head -1)" != "$required_cmake" ]; then
    echo "cmake >= $required_cmake is required (found: ${cmake_version:-none})"
    exit 1
fi

sudo apt-get install -y git wget flex bison gperf python3 python3-pip python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0
mkdir -p ~/esp
pushd ~/esp
git clone -b release/v6.0 --recursive https://github.com/espressif/esp-idf.git
pushd ~/esp/esp-idf
./install.sh esp32
sudo usermod -aG dialout $USER
echo 'alias esp-idf-init=". $HOME/esp/esp-idf/export.sh"' >> ~/.profile

