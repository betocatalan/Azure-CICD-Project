#!/bin/bash 

cd tf/

## SSH Keys

# Create folders and ssh keys
mkdir private
ssh-keygen -f $PWD/private/key_access -N ""

# Change name and privileges
mv $PWD/private/key_access $PWD/private/key_access.pem
chmod 400 $PWD/private/key_access.pem

# Copy to instances module
cp -a $PWD/private $PWD/modules/instances/

## Terraform 
terraform init
terraform apply -auto-approve