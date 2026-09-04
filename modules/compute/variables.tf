variable "rg" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "nic_name" {
  type        = string
  description = "Network interface name"
}

variable "public_ip_name" {
  type        = string
  description = "Public IP name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet resource ID"
}

variable "nsg_id" {
  type        = string
  description = "Network security group resource ID"
}

variable "vm_size" {
  type        = string
  description = "Azure VM size"
}

variable "admin_name" {
  type        = string
  description = "VM administrator username"
}

variable "my_name" {
  type        = string
  description = "Name displayed on the web page"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH Public key"
}