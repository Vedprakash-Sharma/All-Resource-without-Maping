resource "azurerm_storage_container" "tcs" {
  name                  = "hsefcontainer"
  storage_account_name  = "hsefstorage"
  container_access_type = "private"
}