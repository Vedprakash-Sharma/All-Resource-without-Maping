resource "azurerm_network_interface" "tcsnic01" {
  name                = "nichsef"
  location            = "West Europe"
  resource_group_name = "HSEF_Network_Project"

  ip_configuration {
    name                          = "tcsipcon"
    subnet_id                     = data.azurerm_subnet.data_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "tcsvm" {
  name                  = "hsefvm"
  location              = "West Europe"
  resource_group_name   = "HSEF_Network_Project"
  network_interface_ids = [azurerm_network_interface.tcsnic01.id]
  vm_size               = "Standard_DS1_v2"

 storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "tcsdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "tcsofficial"
    admin_username = "tcsadmin"
    admin_password = "Tcs@admin_07"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  
}