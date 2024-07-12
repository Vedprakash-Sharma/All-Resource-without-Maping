# data "azurerm_network_interface" "lbnic" {
#   name                = "bharat-nic"
#   resource_group_name = "frontend-rg"
# }
# data "azurerm_network_interface" "lbnic01" {
#   name                = "pakistan"
#   resource_group_name = "frontend-rg"
# }
data "azurerm_virtual_network" "lbvnet" {
  name                = "veda_vnet"
  resource_group_name = "frontend-rg"
}
