# Terraform Usage

## Technologies Used

- Terraform

## Running Terraform Locally

Running this locally will require a few steps to get setup.

- First install Terraform: <https://learn.hashicorp.com/terraform/getting-started/install.html>.
- Once terraform is installed for your platform, open a command prompt and navigate to this repository under deploy/terraform.

Once the above steps are setup, there are two options to run terraform.

From command-line:

``` bash
terraform init
terraform plan -out tf.plan
terraform apply tf.plan
```

From provided shell script:

Please copy terraform.tfvars to terraform.tfvars.local and update the terraform.tfvars.local with names defined here.

| Variable                   | Description                           |
| -------------------------- | ------------------------------------- |
| TF_VAR_resource_group_name | The resource group name               |
| TF_VAR_location            | The location for all of the resources |
| TF_VAR_resource_prefix     | The prefix for all of the resources   |

Once that's done, then run the shell script 

``` bash
./run-terraform.sh
```

## Azure Pipelines

Documentation TBD
