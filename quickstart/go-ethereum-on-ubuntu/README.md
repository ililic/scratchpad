# Install a Go-Ethereum node on Ubuntu Virtual Machines using Custom Script Linux Extension

<a href=""https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fililic%2fscratchpad%2fmaster%2fquickstart%2fgo-ethereum-on-ubuntu%2fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

This template deploys a Go Ethereum public node on an Ubuntu virtual machines. This template also provisions a storage account, virtual network, availability sets, public IP addresses and network interfaces required by the installation.

##Known Issues and Limitations
- The template does not currently configure SSL on the node.
- The template uses username/password for provisioning and would ideally use an SSH key
