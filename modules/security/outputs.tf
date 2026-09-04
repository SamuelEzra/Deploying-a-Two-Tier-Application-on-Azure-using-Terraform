output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "web_nsg_name" {
  value = azurerm_network_security_group.nsg.name
}

output "db_nsg_id" {
  value = azurerm_network_security_group.nsg_db.id
}

output "db_nsg_name" {
  value = azurerm_network_security_group.nsg_db.name
}