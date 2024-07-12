terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "nginx"  
  #   storage_account_name = "nginxst"                      
  #   container_name       = "nginxcon"                       
  #   key                  = "nginx.terraform.tfstate"        
  # }
}

provider "azurerm" {
  features {}

}