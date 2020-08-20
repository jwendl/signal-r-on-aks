# Module Properties

This module creates an Azure Resource Group.

Example usage and testing

``` hcl
module "resource_group" {
    source                  = "../modules/resource-group"
    resource_group_name     = var.name
    resource_group_location = var.location
}
```

## Requirements

No requirements.

## Providers

| Name    | Version |
|---------|---------|
| azurerm | ~> 2    |

## Inputs

| Name                    | Description                 | Type   | Default | Required |
|-------------------------|-----------------------------|--------|---------|----------|
| resource_group_name     | The resource group name     | string | n/a     | yes      |
| resource_group_location | The resource group location | string | n/a     | yes      |

## Outputs

| Name        | Description |
|-------------|-------------|
| n/a         |             |
