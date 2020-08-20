resource "azurerm_key_vault" "kv" {
    name                        = var.key_vault_name
    resource_group_name         = var.key_vault_resource_group_name
    location                    = var.key_vault_location
    tenant_id                   = var.key_vault_tenant_id
    enabled_for_disk_encryption = true

    sku_name = var.sku_name

    network_acls {
        default_action = "Allow"
        bypass         = "AzureServices"
    }
}
