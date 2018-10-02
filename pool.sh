#!/bin/bash

sudo apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev

sudo apt-get install -y libboost-all-dev git npm nodejs nodejs-legacy libminiupnpc-dev redis-server

sudo add-apt-repository ppa:bitcoin/bitcoin

sudo apt-get update

sudo apt-get -y install libdb4.8-dev libdb4.8++-dev

curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh

bash install_nvm.sh

source ~/.profile

nvm install 8

nvm use 8

nvm alias default 8

nvm use default