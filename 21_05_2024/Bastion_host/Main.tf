resource "azurerm_public_ip" "Bastion_pip" {
  for_each            = var.veda_host
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}

resource "azurerm_bastion_host" "bastion_veda" {
  for_each            = var.veda_host
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.ip_name
    subnet_id            = data.azurerm_subnet.bastion_subnet[each.key].id
    public_ip_address_id = azurerm_public_ip.Bastion_pip[each.key].id
  }
}
