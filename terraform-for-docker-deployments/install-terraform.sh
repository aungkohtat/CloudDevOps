#!/bin/bash

# Add the Hashicorp GPG key
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add the Hashicorp repository to the sources list
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null

# Update the package index
sudo apt-get update

# Install the latest version of Terraform
sudo apt-get install -y terraform

# Verify the Terraform version
terraform version