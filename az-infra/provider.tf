# =========================================================================
# terraform provider and remote backend blocks
# =========================================================================
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "remote-backendrg"
    storage_account_name = "rmtbackend8827730114"
    container_name       = "tfstate"
    key                  = "vmdeployment.tfstate"
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.subscription_id
}
# =========================================================================


