provider "azurerm" {
    version = "~> 2"
    features {
        virtual_machine {
            delete_os_disk_on_deletion = true
        }
        virtual_machine_scale_set {
            roll_instances_when_required = true
        }
        key_vault {
            recover_soft_deleted_key_vaults = true
            purge_soft_delete_on_destroy    = true
        }
    }
}

provider "azuread" {
    version = "~> 0.11"
}

provider "random" {
    version = "~> 2.2"
}
