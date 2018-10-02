#!/bin/bash

dd if=/dev/zero of=/mnt/myswap.swap bs=1M count=4000
mkswap /mnt/myswap.swap
swapon /mnt/myswap.swap
sudo apt-get install -y build-essential python-dev gcc g++ git cmake libboost-all-dev
git clone https://github.com/cryptokatz/testnet-core
cd testnet-core
mkdir build
cd build
cmake ..
make
