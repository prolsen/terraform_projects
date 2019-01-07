#---- General Variables ----#
variable "prefix" {}
variable "location" {}
#---- Resource Group ----#
variable "resource_group_name" {}

#---- Clients subnet id number ----#
variable "client_subnet_id" {}

# ---- Windows 7 client variables ----#
variable "win7_account_replication_type" {}
variable "win7_account_tier" {}
variable "win7_public_ip_address_allocation" {}
variable "win7_private_ip_address_allocation" {}
variable "win7_count" {}
variable "win7_vm_size" {}
variable "win7_admin_username" {}
variable "win7_admin_password" {}
variable "win7_timezone" {}
variable "win7_automatic_upgrades" {}
variable "win7_publisher" {}
variable "win7_offer" {}
variable "win7_sku" {}
variable "win7_rel_version" {}
variable "win7_os_type" {}
variable "win7_create_option" {}
variable "win7_managed_disk_type" {}