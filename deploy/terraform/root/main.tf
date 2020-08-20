provider "azurerm" {
    version = "~> 2"
    features { }
}

provider "null" {
    version = "~> 2.1"
}

provider "azuread" {
    version = "~> 0.11"
}

provider "random" {
    version = "~> 2.2"
}

data "azurerm_client_config" "current" {}

module "resource_group" {
    source                  = "../modules/resource-group"
    resource_group_name     = var.resource_group_name
    resource_group_location = var.resource_group_location
}

module "key_vault" {
    source                        = "../modules/key-vault"
    key_vault_name                = "${var.resource_prefix}kv"
    key_vault_resource_group_name = var.resource_group_name
    key_vault_location            = var.resource_group_location
    key_vault_tenant_id           = data.azurerm_client_config.current.tenant_id
}

module "container_registry" {
    source                   = "../modules/container-registry"
    acr_name                 = "${var.resource_prefix}acr"
    acr_resource_group_name  = var.resource_group_name
    acr_location             = var.resource_group_location
    sku                      = "Standard"
    admin_enabled            = true
    azuread_application_name = "${var.resource_prefix}akssp"
}

module "kubernetes_service" {
    source                   = "../modules/kubernetes-service"
    azuread_application_name = "${var.resource_prefix}akssp"
    aks_name                 = "${var.resource_prefix}aks"
    aks_location             = var.resource_group_location
    aks_resource_group_name  = var.resource_group_name
    aks_dns_prefix           = "${var.resource_prefix}aks"
    aks_kubernetes_version   = "1.17.9"
    aks_vm_min_count         = 1
    aks_vm_max_count         = 30
    acr_id                   = module.container_registry.acr_id
}
