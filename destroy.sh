#!/bin/bash

ENV=$1

if [ -z "$ENV" ]; then
  echo "❌ Please provide environment name (dev, qa, prod)"
  exit 1
fi

cd terraform || exit

terraform workspace select $ENV || terraform workspace new $ENV

terraform destroy -var-file="$ENV.tfvars" -auto-approve

