variable "azuread_application_name" {
    description = "The Azure AD application name for this cluster."
}

variable "aks_name" {
    description = "The Azure Kubernetes Service cluster name."    
}

variable "aks_location" {
    description = "The location of the Azure Kubernetes Service."
}

variable "aks_resource_group_name" {
    description = "The Resource Group name for the Azure Kubernetes Service."
}

variable "aks_dns_prefix" {
    description = "The DNS prefix for the Azure Kubernetes Service."
}

variable "aks_kubernetes_version" {
    default     = "1.17.7"
    description = "The version for kubernetes, defaults to 1.17.7."
}

variable "aks_vm_size" {
    default     = "Standard_DS2_v2"
    description = "The VM size for the nodes in the Azure Kubernetes Service, defaults to Standard_DS2_v2."
}

variable "aks_vm_min_count" {
    default     = 1
    description = "The minimum number of nodes for the Azure Kubernetes Service."
}

variable "aks_vm_max_count" {
    default     = 30
    description = "The maximum number of nodes for the Azure Kubernetes Service."
}

variable "acr_id" {
    description = "The ID for the Azure Container Registry service to connect to."
}