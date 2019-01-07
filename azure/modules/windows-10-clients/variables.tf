#---- General Variables ----#
variable "prefix" {}
variable "location" {}
#---- Resource Group ----#
variable "resource_group_name" {}

#---- Clients subnet id number ----#
variable "client_subnet_id" {}

# ---- Windows 10 client variables ----#
variable "win10_account_replication_type" {}
variable "win10_account_tier" {}
variable "win10_public_ip_address_allocation" {}
variable "win10_private_ip_address_allocation" {}
variable "win10_count" {}
variable "win10_vm_size" {}
variable "win10_admin_username" {}
variable "win10_admin_password" {}
variable "win10_timezone" {}
variable "win10_automatic_upgrades" {}
variable "win10_publisher" {}
variable "win10_offer" {}
variable "win10_sku" {}
variable "win10_rel_version" {}
variable "win10_os_type" {}
variable "win10_create_option" {}
variable "win10_managed_disk_type" {}