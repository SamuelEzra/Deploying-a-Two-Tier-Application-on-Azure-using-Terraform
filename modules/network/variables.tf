variable "rg" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vnet_name" {
  type        = string
  description = "Virtual network name"
}

variable "public_subnet_name" {
  type        = string
  description = "Public Subnet name"
}

variable "private_subnet_name" {
  type        = string
  description = "Private Subnet name"
}

variable "nat_ip_name" {
  type        = string
  description = "NAT Public IP"
}

variable "nat_name" {
  type        = string
  description = "NAT name"
}

variable "vnet_cidr" {
  type        = string
  description = "VNET Address space"
}

variable "public_subnet_cidr" {
  type        = string
  description = "Public subnet address space"
}

variable "private_subnet_cidr" {
  type        = string
  description = "Private subnet address space"
}