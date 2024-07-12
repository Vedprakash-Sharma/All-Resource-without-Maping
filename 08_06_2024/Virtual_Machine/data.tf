data "azurerm_subnet" "data_subnet" {
  name                 = "hsef_subnet"
  virtual_network_name = "hsef_network"
  resource_group_name  = "HSEF_Network_Project"
}