terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.107.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "HSEF_Network_Project" 
    storage_account_name = "hsefstorage"                      
    container_name       = "hsefcontainer"                       
    key                  = "vnet.terraform.tfstate"        
  }
}

provider "azurerm" {
 features {
   
 }
}