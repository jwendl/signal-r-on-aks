resource "random_string" "password" {
    length  = 32
    special = true
}

resource "azuread_application" "aksapp" {
    name = "${var.resource_prefix}aksapp"
}

resource "azuread_service_principal" "akssp" {
    application_id               = azuread_application.aksapp.application_id
    app_role_assignment_required = false
}

resource "azuread_service_principal_password" "akssppwd" {
    service_principal_id = azuread_service_principal.akssp.id
    value                = random_string.password.result
    end_date_relative    = "8760h"
    lifecycle {
        ignore_changes = [
            value,
            end_date_relative
        ]
    }
}

resource "azurerm_kubernetes_cluster" "aks" {
    name                = "${var.resource_prefix}aks"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    dns_prefix          = "${var.resource_prefix}aks"
    kubernetes_version  = "1.17.7"

    default_node_pool {
        name                = "default"
        vm_size             = "Standard_DS2_v2"
        enable_auto_scaling = true
        min_count           = 1
        max_count           = 30
        os_disk_size_gb     = 128
    }

    service_principal {
        client_id     = azuread_service_principal.akssp.application_id
        client_secret = random_string.password.result
    }
}
