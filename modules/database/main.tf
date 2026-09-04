resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "${var.db_name}.private.mysql.database.azure.com"
  resource_group_name = var.rg
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  name = "${var.db_name}-dns-link"
  #resource_group_name   = var.rg
  #private_dns_zone_name = azurerm_private_dns_zone.mysql.name
  private_dns_zone_id  = azurerm_private_dns_zone.dns_zone.id
  virtual_network_id   = var.vnet_id
  registration_enabled = false
}

resource "azurerm_mysql_flexible_server" "mysql" {
  name                = var.db_name
  resource_group_name = var.rg
  location            = var.location

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  version = var.mysql_version

  delegated_subnet_id = var.private_subnet_id
  private_dns_zone_id = azurerm_private_dns_zone.dns_zone.id

  public_network_access = "Disabled"

  sku_name = var.sku_name

  storage {
    size_gb           = var.storage_size_gb
    auto_grow_enabled = true
  }

  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = false

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.dns_link
  ]
}

resource "azurerm_mysql_flexible_database" "db" {
  name                = var.database_name
  resource_group_name = var.rg
  server_name         = azurerm_mysql_flexible_server.mysql.name

  charset   = "utf8mb4"
  collation = "utf8mb4_unicode_ci"
}