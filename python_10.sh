#!/bin/bash

apt update -y
apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev -y
wget https://www.python.org/ftp/python/3.10.4/Python-3.10.4.tgz
tar -xf Python-3.10.4.tgz
cd Python-3.10.4
./configure --enable-optimizations
make altinstall
cd
rm -f Python-3.10.4.tgz
apt install python3-pip
python3 -m pip install --upgrade pip
pip -V
python3.10 --version
