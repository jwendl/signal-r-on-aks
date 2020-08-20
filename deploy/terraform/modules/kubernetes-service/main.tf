resource "random_string" "password" {
    length  = 32
    special = true
}

resource "azuread_application" "aksapp" {
    name = var.azuread_application_name
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
    name                = var.aks_name
    location            = var.aks_location
    resource_group_name = var.aks_resource_group_name
    dns_prefix          = var.aks_dns_prefix
    kubernetes_version  = var.aks_kubernetes_version

    default_node_pool {
        name                = "default"
        vm_size             = var.aks_vm_size
        enable_auto_scaling = true
        min_count           = var.aks_vm_min_count
        max_count           = var.aks_vm_max_count
        os_disk_size_gb     = 128
    }

    service_principal {
        client_id     = azuread_service_principal.akssp.application_id
        client_secret = random_string.password.result
    }
}

resource "azurerm_public_ip" "akspip" {
    name                = "${var.aks_name}pip"
    location            = var.aks_location
    resource_group_name = "MC_${var.aks_resource_group_name}_${var.aks_name}_${var.aks_location}"
    allocation_method   = "Static"
    depends_on          = [
        azurerm_kubernetes_cluster.aks
    ]
}

resource null_resource acr-access {
    provisioner "local-exec" {
        command = "az role assignment create --scope ${var.acr_id} --role acrpull --assignee ${azuread_service_principal.akssp.object_id}"
    }
}
