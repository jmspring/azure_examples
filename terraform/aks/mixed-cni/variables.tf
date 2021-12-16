variable "resource_group_name" {
  type = string
}

variable "base_name_prefix" {
  type = string
}

variable "vnet_address_space" {
  type = string
}

variable "subnet_1_address_space" {
  type = string
}

variable "subnet_2_address_space" {
  type = string
}

variable "aks_cluster_dns_prefix" {
  type = string
}

variable "default_node_pool_count" {
  type = number
}

variable "default_node_pool_vm_size" {
  type = string
}

variable "default_node_pool_name" {
  type = string
}

variable "linux_node_ssh_key" {
  type = string
}

variable "linux_node_username" {
  type = string
}

variable "win_pool_vm_size" {
  type = string
}

variable "win_pool_count" {
  type = number
}

variable "windows_admin_name" {
  type = string
}

variable "windows_admin_password" {
  type = string
}