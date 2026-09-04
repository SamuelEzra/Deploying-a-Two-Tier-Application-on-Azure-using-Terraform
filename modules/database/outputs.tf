output "server_id" {
  value = azurerm_mysql_flexible_server.mysql.id
}

output "server_name" {
  value = azurerm_mysql_flexible_server.mysql.name
}

output "server_fqdn" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}

output "database_name" {
  value = azurerm_mysql_flexible_database.db.name
}

output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.dns_zone.id
}