#!/bin/bash

ENV=$1

if [ -z "$ENV" ]; then
  echo "❌ Please provide environment name (dev, qa, prod)"
  exit 1
fi

cd terraform-ecs || exit

terraform workspace new $ENV || terraform workspace select $ENV

terraform init
terraform plan -var-file="$ENV.tfvars"
terraform apply -var-file="$ENV.tfvars" -auto-approve

