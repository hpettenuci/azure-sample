terraform {
    # Terraform Version
    required_version = ">= 0.13"

    # Required Terraform Providers
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 2.0"
        }        
        azuread = {
            source  = "hashicorp/azuread"
            version = "~> 1.0"
        }
        random = {
            source  = "hashicorp/random"
            version = "~> 3.0"
        }
    }

    # Terraform State Storage 
    # backend "azurerm" {
    #     resource_group_name     = var.backend_rgn
    #     storage_account_name    = var.backend_san
    #     container_name          = var.backend_cn
    #     key                     = var.backend_key
    # }
}

provider "azurerm" {
    features {

    }

    subscription_id = var.az_subscription_id
    client_id       = var.az_client_id
    client_secret   = var.az_client_secret
    tenant_id       = var.az_tenant_id
}

resource "random_pet" "aksrandom" {

}