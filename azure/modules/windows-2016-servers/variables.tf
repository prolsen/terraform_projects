#---- General Variables ----#
variable "prefix" {}
variable "location" {}

#---- Resource Group ----#
variable "resource_group_name" {}

#---- Servers subnet id number ----#
variable "server_subnet_id" {}

# ---- Windows 10 client variables ----#
variable "srv2016_account_replication_type" {}
variable "srv2016_account_tier" {}
variable "srv2016_public_ip_address_allocation" {}
variable "srv2016_private_ip_address_allocation" {}
variable "srv2016_count" {}
variable "srv2016_vm_size" {}
variable "srv2016_admin_username" {}
variable "srv2016_admin_password" {}
variable "srv2016_timezone" {}
variable "srv2016_automatic_upgrades" {}
variable "srv2016_publisher" {}
variable "srv2016_offer" {}
variable "srv2016_sku" {}
variable "srv2016_rel_version" {}
variable "srv2016_os_type" {}
variable "srv2016_create_option" {}
variable "srv2016_managed_disk_type" {}