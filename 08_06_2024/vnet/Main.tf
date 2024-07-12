resource "azurerm_virtual_network" "tcsoffice" {
  name                = "hsef_network"
  location            = "West Europe"
  resource_group_name = "HSEF_Network_Project"
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

}