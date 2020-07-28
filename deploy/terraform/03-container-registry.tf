resource "azurerm_container_registry" "acr" {
    name                     = "${var.resource_prefix}acr"
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    sku                      = "Premium"
    admin_enabled            = true
    georeplication_locations = ["East US", "West Europe"]
}
