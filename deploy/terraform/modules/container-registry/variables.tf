variable "acr_name" {
    description = "The Azure Container Registry name."
}

variable "acr_resource_group_name" {
    description = "The Azure Container Registry Resource Group name."
}

variable "acr_location" {
    description = "The Azure Container Registry location."
}

variable "sku" {
    description = "The sku for Azure Container Registry."
}

variable "admin_enabled" {
    description = "Whether the admin user is enabled or not."
}

variable "azuread_application_name" {
    description = "The Azure AD Application registration for the Azure Kubernetes Service."
}
