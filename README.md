# Terraform Project

# Goal
Learning project for Terraform to provision a small webhosting setup of 2 webservers and 1 load balancer within Azure public cloud.

# Prerequisites
* Azure CLI
* Terraform

# Setup Azure CLI on Ubuntu
Add Microsoft repo to the source repo list using below command:
```
AZ_REPO=$(lsb_release -cs)
echo deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main | sudo tee /etc/apt/sources.list.d/azure-cli.list
```
Add the Microsoft signing key:
```
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add --
```
Finally install the Azure CLI package:
```
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli
```
Verify successful installation
```
az -–version
```
use the following command to login to azure
```
az login
```

# Setup Terraform on Ubuntu
Ensure wget and unzip are installed

Download the latest Terraform release https://releases.hashicorp.com/terraform/
```
wget https://releases.hashicorp.com/terraform/VERSION/terraform_VERSION_linux_amd64.zip
```
Unzip the archive
```
unzip terraform_VERZION_linux_amd64.zip
```
Move the unzipped binary file to the directory /usr/local/bin
```
sudo mv terraform /usr/local/bin/
```
