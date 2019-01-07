#---- General variables ----#
variable "prefix" {}
variable "location" {}

#---- Resouce group variables ----#
variable "resource_group_name" {}

#---- Network information variables ----#
variable "virtual_network_address_space" {
    type = "list"
}
variable "domain_client_subnet" {}

variable "domain_server_subnet" {}

variable "source_address_prefixes" {
    type = "list"
}

#---- Windows 10 client variables ----#
# azurerm_storage_account
variable "win10_account_replication_type" {}
variable "win10_account_tier" {}
# azure_public_ip
variable "win10_public_ip_address_allocation" {}
variable "win10_private_ip_address_allocation" {}
# azurerm_virtual_machine
variable "win10_count" {}
variable "win10_vm_size" {}
# azurerm_virtual_machine_os_profile
variable "win10_admin_username" {}
variable "win10_admin_password" {}
# azurerm_virtual_machine_os_profile_windows_config
variable "win10_enable_automatic_upgrades" {}
variable "win10_timezone" {}
# azurerm_virtual_machine_storage_image_reference
variable "win10_publisher" {}
variable "win10_offer" {}
variable "win10_sku" {}
variable "win10_version" {}
# azurerm_virtual_machine_storage_os_disk
variable "win10_os_type" {}
variable "win10_create_option" {}
variable "win10_managed_disk_type" {}

#---- Windows 7 Client variables ----#
# azurerm_storage_account
variable "win7_account_replication_type" {}
variable "win7_account_tier" {}
# azure_public_ip
variable "win7_public_ip_address_allocation" {}
variable "win7_private_ip_address_allocation" {}
# azurerm_virtual_machine
variable "win7_count" {}
variable "win7_vm_size" {}
# azurerm_virtual_machine_os_profile
variable "win7_admin_username" {}
variable "win7_admin_password" {}
# azurerm_virtual_machine_os_profile_windows_config
variable "win7_enable_automatic_upgrades" {}
variable "win7_timezone" {}
# azurerm_virtual_machine_storage_image_reference
variable "win7_publisher" {}
variable "win7_offer" {}
variable "win7_sku" {}
variable "win7_version" {}
# azurerm_virtual_machine_storage_os_disk
variable "win7_os_type" {}
variable "win7_create_option" {}
variable "win7_managed_disk_type" {}

#---- Windows Server 2016 variables ----#
# azurerm_storage_account
variable "srv2016_account_replication_type" {}
variable "srv2016_account_tier" {}
# azure_public_ip
variable "srv2016_public_ip_address_allocation" {}
variable "srv2016_private_ip_address_allocation" {}
# azurerm_virtual_machine
variable "srv2016_count" {}
variable "srv2016_vm_size" {}
# azurerm_virtual_machine_os_profile
variable "srv2016_admin_username" {}
variable "srv2016_admin_password" {}
# azurerm_virtual_machine_os_profile_windows_config
variable "srv2016_enable_automatic_upgrades" {}
variable "srv2016_timezone" {}
# azurerm_virtual_machine_storage_image_reference
variable "srv2016_publisher" {}
variable "srv2016_offer" {}
variable "srv2016_sku" {}
variable "srv2016_version" {}
# azurerm_virtual_machine_storage_os_disk
variable "srv2016_os_type" {}
variable "srv2016_create_option" {}
variable "srv2016_managed_disk_type" {}