output "vm_private_ips" {
  value = { for vm_name, vm_instance in 
  data.azurerm_virtual_machine.outputvm : vm_name => vm_instance.private_ip_addresses }
}
