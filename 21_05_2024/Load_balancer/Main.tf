
# Public IP Address
resource "azurerm_public_ip" "lbpip" {
  name                = "LBpublicip"
  location            = "eastus"
  resource_group_name = "lbresources"
  allocation_method   = "Static"
}
# Load Balancer
resource "azurerm_lb" "mainlb" {
  name                = "LBvedanta"
  location            = "eastus"
  resource_group_name = "lbresources"

  frontend_ip_configuration {
    name                 = "frontendIPAddress"
    public_ip_address_id = azurerm_public_ip.lbpip.id
  }
}
# Backend Pool
resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  loadbalancer_id    = azurerm_lb.mainlb.id
  name               = "BackendPool"
  # virtual_network_id = azurerm_network_interface.lbnic.id
}
# Network Interface Backend Pool Association
resource "azurerm_network_interface_backend_address_pool_association" "lbvmmachine" {
  network_interface_id    = data.azurerm_network_interface.lbnic.id
  ip_configuration_name   = data.azurerm_network_interface.lbnic.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_pool.id
}
resource "azurerm_network_interface_backend_address_pool_association" "lbvmmachine01" {
  network_interface_id    = data.azurerm_network_interface.lbnic01.id
  ip_configuration_name   = data.azurerm_network_interface.lbnic01.ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_pool.id
}
# Health Probe
resource "azurerm_lb_probe" "lbprobe" {
  loadbalancer_id = azurerm_lb.mainlb.id
  name            = "ssh-running-probe"
  port            = 80
}
# Load Balancer Rule
resource "azurerm_lb_rule" "lbrule" {
  loadbalancer_id                = azurerm_lb.mainlb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontendIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_pool.id]
  probe_id                       = azurerm_lb_probe.lbprobe.id
}


