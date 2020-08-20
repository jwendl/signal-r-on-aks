# Module Properties

This module creates an [Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry/) using the [azurerm_container_registry](https://www.terraform.io/docs/providers/azurerm/r/container_registry.html) [Azure Terraform Provider](https://github.com/terraform-providers/terraform-provider-azurerm) object.

Example usage and testing

``` hcl
module "container_registry" {
    source                   = "../modules/container-registry"
    acr_name                 = var.acr_name
    acr_resource_group_name  = var.acr_resource_group_name
    acr_location             = var.acr_location
    sku                      = var.sku
    admin_enabled            = var.admin_enabled
    location_list            = var.location_list
}
```

## Requirements

No requirements.

## Providers

| Name    | Version |
|---------|---------|
| azurerm | ~> 2    |

## Inputs

| Name                     | Description                                                                               | Type         | Default | Required |
| ------------------------ | ----------------------------------------------------------------------------------------- | ------------ | ------- | -------- |
| acr_name                 | The Azure Container Registry Name                                                         | string       | n/a     | yes      |
| acr_resource_group_name  | The Azure Container Registry Resource Group Name                                          | string       | n/a     | yes      |
| acr_location             | The Azure Container Registry Location                                                     | string       | n/a     | yes      |
| sku                      | The Azure Container Registry sku - valid values are: Basic, Standard, Premium and Classic | string       | n/a     | yes      |
| admin_enabled            | Whether the admin user is created in Azure Container Registry                             | string       | n/a     | yes      |
| location_list            | The list of locations for the backup replication. Formmatted like ["eastus", "westus"]    | list(string) | n/a     | yes      |

## Outputs

| Name   | Description                                          |
| ------ | ---------------------------------------------------- |
| acr_id | The full id to the azure container registry instance |
