#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y curl

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -q -y

