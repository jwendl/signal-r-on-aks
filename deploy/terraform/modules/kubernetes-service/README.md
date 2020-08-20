# Module Properties

This module creates an [Azure Kubernetes Service](https://azure.microsoft.com/en-us/overview/kubernetes-on-azure) using the [azurerm_kubernetes_cluster](https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html) [Azure Terraform Provider](https://github.com/terraform-providers/terraform-provider-azurerm) object.


Example usage and testing

``` hcl
module "kubernetes_service" {
    source                   = "../modules/kubernetes-service"
    azuread_application_name = var.azuread_application_name
    aks_name                 = var.aks_name
    aks_location             = var.aks_location
    aks_resource_group_name  = var.aks_resource_group_name
    aks_dns_prefix           = var.aks_dns_prefix
    aks_kubernetes_version   = var.aks_kubernetes_version
    aks_vm_size              = var.aks_vm_size
    aks_vm_min_count         = var.aks_vm_min_count
    aks_vm_max_count         = var.aks_vm_max_count
    acr_id                   = var.acr_id
}
```

## Requirements

No requirements.

## Providers

| Name    | Version |
|---------|---------|
| azurerm | ~> 2    |

## Inputs

| Name                     | Description                                                                      | Type    | Default         | Required |
| ------------------------ | -------------------------------------------------------------------------------- | ------- | --------------- | -------- |
| azuread_application_name | The name for the Azure AD Application assigned to the cluster.                   | string  | n/a             | yes      |
| aks_name                 | The name of the Azure Kubernetes Service cluster.                                | string  | n/a             | yes      |
| aks_location             | The location for the Azure Kubernetes Cluster.                                   | string  | n/a             | yes      |
| aks_resource_group_name  | The name of the Resource Group for the Azure Kubernetes Cluster.                 | string  | n/a             | yes      |
| aks_dns_prefix           | The DNS prefix for the Azure Kubernetes Service cluster.                         | string  | n/a             | yes      |
| aks_kubernetes_version   | The version for Azure Kubernetes Service                                         | string  | "1.17.7"        | yes      |
| aks_vm_size              | The size of the Virtual Machines for the Azure Kubernetes Service cluster.       | string  | Standard_DS2_v2 | yes      |
| aks_vm_min_count         | The minimum number of Virutal Machines for the Azure Kubernetes Service.         | integer | 1               | yes      |
| aks_vm_max_count         | The maximum number of Virtual Machines for the Azure Kubernetes Service cluster. | integer | 30              | yes      |
| acr_id                   | The ID to the ACR instance                                                       | string  | n/a             | yes      |

## Outputs

| Name        | Description |
|-------------|-------------|
| n/a         |             |
