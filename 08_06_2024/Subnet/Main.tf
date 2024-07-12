resource "azurerm_subnet" "tcssubnet" {
  name                 = "hsef_subnet"
  resource_group_name  = "HSEF_Network_Project"
  virtual_network_name = "hsef_network"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "tcssubnetbastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "HSEF_Network_Project"
  virtual_network_name = "hsef_network"
  address_prefixes     = ["10.0.2.0/24"]
}