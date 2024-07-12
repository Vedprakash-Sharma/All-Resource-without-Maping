veda_host = {
  bastion-01 = {
    pip_name             = "host_pip"
    location             = "eastus"
    resource_group_name  = "nginx"
    allocation_method    = "Static"
    sku                  = "Standard"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "web_vnet"
    bastion_name         = "Host"
    ip_name              = "IpHost"
  }
}