data "azurerm_subnet" "nginx_subnet" {
  name                 = "nginx01"
  virtual_network_name = "web_vnet"
  resource_group_name  = "nginx"

}