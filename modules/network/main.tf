resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg
  address_space       = [var.vnet_cidr]
}

resource "azurerm_subnet" "public_subnet" {
  name                 = var.public_subnet_name
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.public_subnet_cidr]
}

resource "azurerm_subnet" "private_subnet" {
  name                 = var.private_subnet_name
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.private_subnet_cidr]

  delegation {
    name = "mysql-delegation"

    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}

resource "azurerm_public_ip" "nat_ip" {
  name                = var.nat_ip_name
  location            = var.location
  resource_group_name = var.rg
  allocation_method   = "Static"
  sku                 = "Standard"

}

resource "azurerm_nat_gateway" "nat" {
  name                    = var.nat_name
  location                = var.location
  resource_group_name     = var.rg
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10

}

resource "azurerm_nat_gateway_public_ip_association" "nat_pub" {
  nat_gateway_id       = azurerm_nat_gateway.nat.id
  public_ip_address_id = azurerm_public_ip.nat_ip.id
}

resource "azurerm_subnet_nat_gateway_association" "nat_priv" {
  subnet_id      = azurerm_subnet.private_subnet.id
  nat_gateway_id = azurerm_nat_gateway.nat.id
}

resource "azurerm_route_table" "route_pub" {
  name                = "${var.vnet_name}-public_rt"
  location            = var.location
  resource_group_name = var.rg

  route {
    name           = "InternetRoute"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }
}

resource "azurerm_route_table" "route_priv" {
  name                = "${var.vnet_name}-private_rt"
  location            = var.location
  resource_group_name = var.rg

}

resource "azurerm_subnet_route_table_association" "rt_ass_public" {
  subnet_id      = azurerm_subnet.public_subnet.id
  route_table_id = azurerm_route_table.route_pub.id
}

resource "azurerm_subnet_route_table_association" "rt_ass_private" {
  subnet_id      = azurerm_subnet.private_subnet.id
  route_table_id = azurerm_route_table.route_priv.id
}