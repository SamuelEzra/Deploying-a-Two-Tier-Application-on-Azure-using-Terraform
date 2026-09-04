output "public_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "public_ip_id" {
  value = azurerm_public_ip.public_ip.id
}

output "private_ip" {
  value = azurerm_network_interface.nic.private_ip_address
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}