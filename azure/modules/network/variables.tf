variable "prefix" {}

variable "location" {}

variable "resource_group_name" {}

variable "address_space" {
  type = "list"
}

variable "client_address_prefix" {}

variable "server_address_prefix" {}

variable "source_address_prefixes" {
  type = "list"
}

