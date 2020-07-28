#!/bin/bash

set -a
[[ -f .env.local ]] && . ./.env.local

terraform init
terraform plan -out tf.plan
terraform apply tf.plan

set +a
