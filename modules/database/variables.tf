variable "rg" {
  type = string
}

variable "location" {
  type = string
}

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

variable "private_subnet_id" {
  type = string
}

variable "vnet_id" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "storage_size_gb" {
  type    = number
  default = 20
}

variable "sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "my_name" {
  type = string
}