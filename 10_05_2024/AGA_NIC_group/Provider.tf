terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.103.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "frontend-rg"
    storage_account_name = "storagebharat"
    container_name       = "vedacontainer01"
    key                  = "nic.tfstate"
  }
}
provider "azurerm" {
  features {

  }
}