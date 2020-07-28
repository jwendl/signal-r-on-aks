# Getting Started

This will describe how I run terraform for this repository.

## Locally

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

Please copy .env to .env.local and updated .env.local with names defined here.

| Variable | Description |
| -------- | ----------- |
| TF_VAR_resource_group_name | The resource group name |
| TF_VAR_location | The location for all of the resources |
| TF_VAR_resource_prefix | The prefix for all of the resources |

Once that's done, then run the shell script 

``` bash
./run-terraform.sh
```

## Adding AcrPull to ACR for the Cluster

We need to do this manually at the moment because the azurerm_role_assignment terraform task is replying with a 400 bad request for some reason. Just run the following Azure CLI.

``` bash
az aks update --resource-group SocketOnAks --name jwsocketaks --attach-acr jwsocketacr
```

## Adding public ip...

We need to do this manually too because it needs to exist in the hidden cluster resource group

``` bash
az network public-ip create --resource-group MC_SocketOnAks_jwsocketaks_westus2 --name jwsocketakspip --sku Basic --allocation-method static --query publicIp.ipAddress --output tsv
```

## Azure Pipelines

Documentation TBD
