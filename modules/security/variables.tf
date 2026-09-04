variable "rg" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "nsg" {
  type        = string
  description = "Network security group name"
}

variable "db_nsg_name" {
  type        = string
  description = "Database NSG"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public Subnet Address Space"
}

variable "private_subnet_id" {
  type = string
}

variable "my_ip" {
  type = string
}