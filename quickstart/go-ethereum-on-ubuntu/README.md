# Install a Go-Ethereum node on Ubuntu Virtual Machines using Custom Script Linux Extension

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

This template deploys a Go Ethereum public node on an Ubuntu virtual machines. This template also provisions a storage account, virtual network, availability sets, public IP addresses and network interfaces required by the installation.

##Known Issues and Limitations
- The template does not currently configure SSL on the node.
- The template uses username/password for provisioning and would ideally use an SSH key
