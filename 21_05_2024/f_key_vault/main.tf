data "azurerm_client_config" "current" {
  for_each = var.veda_key
}
resource "azurerm_key_vault" "tcs_key" {
  for_each = var.veda_key 
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current[each.key].tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current[each.key].tenant_id
    object_id = data.azurerm_client_config.current[each.key].object_id

    key_permissions = [
      "Create",
      "Get",
      "List",

    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover",
      "List",
    ]
  }
}

resource "azurerm_key_vault_secret" "tcskey" {
  for_each = var.veda_key 
  name         = "secret-name"
  value        = "adminuser"
  key_vault_id = azurerm_key_vault.tcs_key[each.key].id
}
resource "azurerm_key_vault_secret" "password" {
  for_each = var.veda_key 
  name         = "secret-password"
  value        = random_password.password[each.key].result
  key_vault_id = azurerm_key_vault.tcs_key[each.key].id
}

resource "random_password" "password" {
  for_each = var.veda_key 
  length           = 16
  special          = true
  override_special = "_=+[]{}?"
}
