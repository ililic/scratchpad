#!/bin/bash

# print commands and arguments as they are executed
set -x

echo "initializing geth installation"
date
ps axjf

#############
# Parameters
#############

AZUREUSER=$1
HOMEDIR="/home/$AZUREUSER"
VMNAME=`hostname`
echo "User: $AZUREUSER"
echo "User home dir: $HOMEDIR"
echo "vmname: $VMNAME"

#####################
# setup the Azure CLI
#####################
time sudo npm install azure-cli -g
time sudo update-alternatives --install /usr/bin/node nodejs /usr/bin/nodejs 100

####################
# Setup Geth
####################
time sudo apt-get -y git
time sudo apt-get install -y software-properties-common
time sudo add-apt-repository -y ppa:ethereum/ethereum
time sudo add-apt-repository -y ppa:ethereum/ethereum-dev
time sudo apt-get update
time sudo apt-get install -y ethereum

# Make the $HOMEDIR/blockchain directory to skip the legalese
mkdir -p $HOMEDIR/blockchain

echo "Geth log:" > geth.log

sudo chown $AZUREUSER geth.log && sudow chgrp $AZUREUSER geth.log
sudo chown -R $AZUREUSER $HOMEDIR/blockchain && sudo chgrp -R $AZUREUSER $HOMEDIR/blockchain

wget https://raw.githubusercontent.com/ConsenSys/public-testnet/master/genesis.json

nohup geth --genesis genesis.json --networkid 161  --rpc --rpccorsdomain "*" --datadir $HOMEDIR/blockchain > $HOMEDIR/geth.log &

date
echo "completed geth install $$"
