resource "azurerm_virtual_network_peering" "veda-vnet-peering01" {
  name                      = "peer1to2"
  resource_group_name       = "frontend-rg"
  virtual_network_name      = "veda_vnet"
  remote_virtual_network_id = data.azurerm_virtual_network.veda_remote_vnet02.id
}

resource "azurerm_virtual_network_peering" "veda_vnet_peering02" {
  name                      = "peer2to1"
  resource_group_name       = "backend-rg"
  virtual_network_name      = "veda_virtual_network"
  remote_virtual_network_id = data.azurerm_virtual_network.veda_remote_vnet01.id
}

