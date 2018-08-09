#!/bin/bash

echo '[\033[0;34mi\033[0m] Updating the index of packages'
sudo apt-get update

echo '[\033[0;34mi\033[0m] Updating packages'
sudo apt-get upgrade

echo '[\033[0;34mi\033[0m] Installing all necessary packages and the latest version of ruby'
sudo apt-get install git ruby-dev `apt-cache search ruby | grep -E -o -m 1 '^ruby[0-9]{1}.[0-9]{1}(|.[0-9]{1})'` libxml2 libxml2-dev libxslt1-dev libcurl4-gnutls-dev

if ![ -d ~/opt ]; then
    echo '[\033[0;34mi\033[0m] Creating directory /opt'
    mkdir ~/opt/
fi

cd ~/opt

echo '[\033[0;34mi\033[0m] Clonning wpscan repo'
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan

echo '[\033[0;34mi\033[0m] Installing the required ruby gems using bundler'
sudo gem install bundler && bundle install --without test

echo '[\033[0;34mi\033[0m] \033[1;32mSUCCESS!!!\033[0m\nmeow'
