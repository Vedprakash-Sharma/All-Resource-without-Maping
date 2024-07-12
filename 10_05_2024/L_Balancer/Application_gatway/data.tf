data "azurerm_subnet" "application_getway_subnet" {
  name                 = "backend-subnet"
  virtual_network_name = "veda_vnet"
  resource_group_name  = "frontend-rg"
}