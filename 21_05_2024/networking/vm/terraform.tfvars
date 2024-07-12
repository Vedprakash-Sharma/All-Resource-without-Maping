virtule_machine = {
  vm-01 = {
    name_nic                        = "nic0vm"
    location                        = "eastus"
    resource_group_name             = "nginx"
    name_ip_configuration           = "vip"
    private_ip_address_allocation   = "Dynamic"
    name_vm                         = "machine01"
    size                            = "Standard_F2"
    admin_username                  = "Urjita"
    admin_password                  = "Ved@rinkee"
    disable_password_authentication = false
  }
  vm-02 = {
    name_nic                        = "nic1v"
    location                        = "eastus"
    resource_group_name             = "nginx"
    name_ip_configuration           = "vvip"
    private_ip_address_allocation   = "Dynamic"
    name_vm                         = "machine02"
    size                            = "Standard_F2"
    admin_username                  = "Ganga"
    admin_password                  = "Ved@sharma"
    disable_password_authentication = false
  }
}