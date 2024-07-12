data "azurerm_virtual_network" "veda_remote_vnet01" {
  name                = "veda_vnet"
  resource_group_name = "frontend-rg"
}

data "azurerm_virtual_network" "veda_remote_vnet02" {
  name                = "veda_virtual_network"
  resource_group_name = "backend-rg"
}