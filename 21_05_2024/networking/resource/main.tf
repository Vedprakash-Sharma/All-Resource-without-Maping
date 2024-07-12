resource "azurerm_resource_group" "rg_for_vm" {
  name     = "nginx"
  location = "eastus"
}

resource "azurerm_storage_account" "nginxstorage" {
  name                     = "nginxst"
  resource_group_name      = azurerm_resource_group.rg_for_vm.name
  location                 = azurerm_resource_group.rg_for_vm.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  depends_on = [ azurerm_resource_group.rg_for_vm ]
}

resource "azurerm_storage_container" "nginxcontainer" {
  name                  = "nginxcon"
  storage_account_name  = azurerm_storage_account.nginxstorage.name
  container_access_type = "private"
  depends_on = [ azurerm_storage_account.nginxstorage ]
}

resource "azurerm_virtual_network" "vnet_for_vm" {
  name                = "web_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = "nginx"
  depends_on          = [azurerm_resource_group.rg_for_vm]
}


resource "azurerm_subnet" "subnet_for_vm" {
  name                 = "nginx01"
  resource_group_name  = "nginx"
  virtual_network_name = "web_vnet"
  address_prefixes     = ["10.0.1.0/24"]
  depends_on           = [azurerm_virtual_network.vnet_for_vm]

}

resource "azurerm_subnet" "subnet_for_nginx" {
  name                 = "nginx02"
  resource_group_name  = "nginx"
  virtual_network_name = "web_vnet"
  address_prefixes     = ["10.0.2.0/24"]
  depends_on           = [azurerm_virtual_network.vnet_for_vm]

}
resource "azurerm_subnet" "subnet_lb" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "nginx"
  virtual_network_name = "web_vnet"
  address_prefixes     = ["10.0.4.0/24"]

}
