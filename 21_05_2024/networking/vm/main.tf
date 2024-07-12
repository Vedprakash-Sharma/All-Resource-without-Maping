resource "azurerm_network_interface" "lbnic" {
  for_each            = var.virtule_machine
  name                = each.value.name_nic
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.name_ip_configuration
    subnet_id                     = data.azurerm_subnet.nginx_subnet.id
    private_ip_address_allocation = each.value.private_ip_address_allocation

  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.virtule_machine
  name                            = each.value.name_vm
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids = [
    azurerm_network_interface.lbnic[each.key].id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}