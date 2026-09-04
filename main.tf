module "resource_group" {
  source   = "./modules/resource_group"
  rg       = var.rg_name
  location = var.rg_location
}

module "network" {
  source = "./modules/network"

  rg       = module.resource_group.rg_name
  location = module.resource_group.location

  vnet_name = var.vnet_name
  vnet_cidr = var.vnet_cidr

  public_subnet_name = var.public_subnet_name
  public_subnet_cidr = var.public_subnet_cidr

  private_subnet_name = var.private_subnet_name
  private_subnet_cidr = var.private_subnet_cidr

  nat_name    = var.nat_name
  nat_ip_name = var.nat_ip_name
}

module "security" {
  source = "./modules/security"

  rg       = module.resource_group.rg_name
  location = module.resource_group.location

  nsg                = var.nsg
  db_nsg_name        = var.db_nsg_name
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_id  = module.network.private_subnet_id
  my_ip              = var.my_ip
}

module "compute" {
  source         = "./modules/compute"
  rg             = module.resource_group.rg_name
  location       = module.resource_group.location
  public_ip_name = var.public_ip_name
  nic_name       = var.nic
  subnet_id      = module.network.public_subnet_id
  nsg_id         = module.security.nsg_id
  vm_name        = var.vm_name
  vm_size        = var.vm_capacity
  admin_name     = var.admin_name
  ssh_public_key = var.ssh_public_key
  my_name        = var.my_name
}

module "database" {
  source = "./modules/database"

  rg       = module.resource_group.rg_name
  location = module.resource_group.location

  db_name       = var.db_name
  database_name = var.database_name

  mysql_version = var.mysql_version

  private_subnet_id = module.network.private_subnet_id
  vnet_id           = module.network.vnet_id

  admin_username = var.db_admin_username
  admin_password = var.db_admin_password

  storage_size_gb = var.db_storage_size_gb
  sku_name        = var.db_sku_name

  backup_retention_days = var.db_backup_retention_days

  my_name = var.my_name
}