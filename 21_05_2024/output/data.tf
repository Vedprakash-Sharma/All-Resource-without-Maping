data "azurerm_virtual_machine" "outputvm" {
  for_each            = var.vm_configurations
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
