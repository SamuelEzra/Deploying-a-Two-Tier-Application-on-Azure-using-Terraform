# -------------------------
# Resource Group
# -------------------------

variable "rg_name" {
  type = string
}

variable "rg_location" {
  type = string
}


# -------------------------
# Network
# -------------------------

variable "vnet_name" {
  type = string
}

variable "vnet_cidr" {
  type = string
}

variable "public_subnet_name" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "nat_name" {
  type = string
}

variable "nat_ip_name" {
  type = string
}

variable "public_rt_name" {
  type = string
}

variable "private_rt_name" {
  type = string
}


# -------------------------
# Security
# -------------------------

variable "nsg" {
  type = string
}

variable "db_nsg_name" {
  type = string
}

variable "my_ip" {
  type = string
}


# -------------------------
# Compute
# -------------------------

variable "public_ip_name" {
  type = string
}

variable "nic" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_capacity" {
  type = string
}

variable "admin_name" {
  type = string
}

variable "my_name" {
  type = string
}

variable "ssh_public_key" {
  type = string
}


# -------------------------
# Database
# -------------------------

variable "db_name" {
  type = string
}

variable "database_name" {
  type = string
}

variable "mysql_version" {
  type    = string
  default = "8.0.21"
}

variable "db_admin_username" {
  type = string
}

variable "db_admin_password" {
  type      = string
  sensitive = true
}

variable "db_storage_size_gb" {
  type    = number
  default = 20
}

variable "db_sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "db_backup_retention_days" {
  type    = number
  default = 7
}
