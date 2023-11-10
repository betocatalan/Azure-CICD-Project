#!/bin/bash

cd tf/

# Destroy terraform-managed infrastructure.
terraform destroy -auto-approve

# Remove private folder
rm -rf private
rm -rf modules/instances/private