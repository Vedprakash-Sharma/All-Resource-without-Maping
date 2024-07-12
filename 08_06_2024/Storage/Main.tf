resource "azurerm_storage_account" "example" {
  name                     = "hsefstorage"
  resource_group_name      = "HSEF_Network_Project"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}