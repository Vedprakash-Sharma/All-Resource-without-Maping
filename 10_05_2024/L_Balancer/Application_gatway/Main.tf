# Public IP Address
resource "azurerm_public_ip" "app-pip" {
  name                = "app-publicpip"
  location            = "centralindia"
  resource_group_name = "frontend-rg"
  allocation_method   = "Static"
}

resource "azurerm_application_gateway" "network" {
  name                = "ganga-appgateway"
  resource_group_name = "frontend-rg"
  location            = "centralindia"

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 4
  }

  gateway_ip_configuration {
    name      = "gateway-ip-confi"
    subnet_id = data.azurerm_subnet.application_getway_subnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.app-pip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}
resource "azurerm_virtual_network" "app-vnet" {
    name                = "app_virtule_network"
    location            = "centralindia"
    resource_group_name = "frontend-rg"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.1.5"]
  }



locals {
  backend_address_pool_name      = "${azurerm_virtual_network.app-vnet.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.app-vnet.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.app-vnet.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.app-vnet.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.app-vnet.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.app-vnet.name}-rqrt"
  redirect_configuration_name    = "${azurerm_virtual_network.app-vnet.name}-rdrcfg"
}