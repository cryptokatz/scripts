#!/bin/bash

cd ~
cd testnet-core
cd build
git pull
cmake ..
make
cd src
ls
