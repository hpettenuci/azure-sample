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

  backend "azurerm" {
    resource_group_name  = "cloud-shell-storage-eastus"
    storage_account_name = "terraformstorestate"
    container_name       = "tfstatefiles"
    key                  = "terraform-azure-sample.tfstate"
  }
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