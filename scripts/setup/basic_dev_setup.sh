#!/bin/bash

set -e

username=${1:-user}
password=${2:-password}
gitusername=${3:-}
gituseremail=${4:-}

# Disable interactive geo-location selection
export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
apt-get update
apt-get install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata

apt-get install -y wget vim net-tools git curl build-essential pkg-config libcurl4-openssl-dev cmake libssl-dev uuid-dev valgrind sudo
apt-get clean

# Add user
useradd -d /home/$username/ -m -s /bin/bash -U $username
chown -R $username:$username /home/$username/
echo "$username:$password" | chpasswd
usermod -aG sudo $username
usermod -aG _ssh $username
echo "$username ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

# Configure user preferences
su $username

if [ -n "$gitusername" ]; then
    git config --global user.name "$gitusername"
fi
if [ -n "$gituseremail" ]; then
    git config --global user.email "$gituseremail"
fi
git config --global credential.helper 'store --file ~/.git-credentials'

git config --global alias.sus "submodule status --recursive"
git config --global alias.suf "submodule foreach"
git config --global alias.su "submodule update"
git config --global alias.sui "submodule update --init"
git config --global alias.suir "submodule update --init --recursive"
git config --global alias.nuke '!git checkout && git clean -xdff || :2'

./bash_profile.sh

cd ~

