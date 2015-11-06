# Geth Private Node

This Microsoft Azure template deploys a single Ethereum client with a private chain for development and testing.

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

Once your deployment is complete you will have a sandbox environment with:

1. A Genesis file loading the provided private key with funds to test on the network

2. A private key** to import on into your ethereum node

3. A script to activate your private blockchain and begin interacting with the Ethereum protocol.


** Note this private key is exposed on a public GitHub repository. It should _never_ be used on a public network. If you use this key for anything besides sandbox testing purposes, your funds will be lost!


![Ethereum-Azure](https://raw.githubusercontent.com/ililic/scratchpad/master/quickstart/go-ethereum-on-ubuntu/images/eth.jpg)


# Template Parameters
When you launch the installation of the cluster, you need to specify the following parameters:
* `newStorageAccountNamePrefix`: make sure this is a unique identifier. Azure Storage's accounts are global so make sure you use a prefix that is unique to your account otherwise there is a good change it will clash with names already in use.
* `vmDnsName`: this is the public DNS name for the VM that you will use interact with your geth console. You just need to specify an unique name.
* `adminUsername`: self-explanatory. This is the account you will use for connecting to the node
* `adminPassword`: self-explanatory. Be aware that Azure requires passwords to have One upper case, one lower case, a special character, and a number
* `vmSize`: The type of VM that you want to use for the node. The default size is D1 (1 core 3.5GB RAM) but you can change that if you expect to run workloads that require more RAM or CPU resources.
* `location`: The region where the VM should be deployed to

# Go Ethereum Private Node Walkthrough
1. Get your node's IP
 1. browse to https://portal.azure.com

 2. then click browse all, followed by "resource groups", and choose your resource group

 3. then expand your resources, and public ip address of your node.

2. Connect to your geth node
 1. SSH to the public ip of your node as the user you specified for `adminUsername`
 2. Enter your `adminPassword`

3. Import the private key
 1. By running the `ls` command you should see three files: `genesis.json`, `priv_genesis.key`, `start-private-blockchain.sh` and `GuestBook.sol`
 2. Import the private key into geth by running the command `geth account import priv_genesis.key`
 3. Accept the legal disclaimer
 4. Enter a password to secure the key within geth

4. Initiate the private blockchain
 1. Run the command `sh start-private-blockchain.sh` to create your genesis block for your private Ethereum blockchain
 2. You are now in the go-ethereum command line console. You can verify that your private blockchain was successfully created by checking the balance via the console: `eth.getBalance('7fbe93bc104ac4bcae5d643fd3747e1866f1ece4')`
 3. You are now able to deploy a smart contract to the Ethereum network

# Deploying your first contract

Welcome to the Ethereum ecosystem. You are now on your journey to becoming a decentralized application developer.

Earlier when you ran the `ls` command there was a file named `GuestBook.sol` - this is a very simple guest book contract written in the Solidity smart contract programming language.

Learning Solidity is beyond the scope of this walk through, but feel free to read the code and try to understand what the contract is trying to do.  
