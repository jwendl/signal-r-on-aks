#!/bin/bash

pushd root

cp terraform.tfvars terraform.tfvars.bak
cp terraform.tfvars.local terraform.tfvars

terraform init
terraform plan -out tf.plan --var-file terraform.tfvars
terraform apply tf.plan

cp terraform.tfvars.bak terraform.tfvars
rm tf.plan

popd
