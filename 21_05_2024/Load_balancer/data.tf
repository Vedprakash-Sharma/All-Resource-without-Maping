data "azurerm_network_interface" "lbnic" {
  name                = "lbnic"
  resource_group_name = "lbresources"
}


data "azurerm_network_interface" "lbnic01" {
  name                = "lbnic01"
  resource_group_name = "lbresources"
}