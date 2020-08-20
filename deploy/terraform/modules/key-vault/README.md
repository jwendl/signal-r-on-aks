# Module Properties

This module creates an [Azure Key Vault](https://azure.microsoft.com/en-us/services/key-vault/) using the [azurerm_key_vault](https://www.terraform.io/docs/providers/azurerm/r/key_vault.html) [Azure Terraform Provider](https://github.com/terraform-providers/terraform-provider-azurerm) object.

Example usage and testing

``` hcl
module "key_vault" {
    source                        = "../modules/key-vault"
    key_vault_name                = var.key_vault_name
    key_vault_resource_group_name = var.resource_group_name
    key_vault_location            = var.resource_group_location
    key_vault_tenant_id           = data.azurerm_client_config.current.tenant_id
}
```

## Requirements

No requirements.

## Providers

| Name    | Version |
|---------|---------|
| azurerm | ~> 2    |

## Inputs

| Name                          | Description                       | Type   | Default | Required |
|-------------------------------|-----------------------------------|--------|---------|----------|
| key_vault_name                | The key vault name                | string | n/a     | yes      |
| key_vault_resource_group_name | The key vault resource group name | string | n/a     | yes      |
| key_vault_location            | The key vault location            | string | n/a     | yes      |
| key_vault_tenant_id           | The key vault tenant id           | string | n/a     | yes      |

## Outputs

| Name        | Description |
|-------------|-------------|
| n/a         |             |
