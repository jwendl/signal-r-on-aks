data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
    name                        = "${var.resource_prefix}-kv"
    resource_group_name         = azurerm_resource_group.rg.name
    location                    = azurerm_resource_group.rg.location
    enabled_for_disk_encryption = true
    tenant_id                   = data.azurerm_client_config.current.tenant_id

    sku_name = "standard"

    network_acls {
        default_action = "Allow"
        bypass         = "AzureServices"
    }
}
