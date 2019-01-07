#---- General variables ----#
prefix                          = "dfir"
location                        = "East US"

#---- Resouce group variables ----#
resource_group_name             = "dfir-resources"

#---- Network information variables ----#

# Virtual network address space.
virtual_network_address_space   = ["10.0.0.0/16"]

# Subnet ranges for the client and servers.
domain_client_subnet            = "10.0.1.0/24"
domain_server_subnet            = "10.0.0.0/24"

# Security Group(s)
# This is your, "whatismyip" IP address.
source_address_prefixes         = ["x.x.x.x/32"] 

#######################################
# Be mindful of your CPU core limits
# By default, you have 10 cores.
#######################################

#---- Windows 10 client variables ----#
# Number of clients
win10_count = 2
# azurerm_storage_account
win10_account_replication_type      = "LRS"
win10_account_tier                  = "Standard"
# azure_public_ip
win10_public_ip_address_allocation  = "static"
win10_private_ip_address_allocation = "dynamic"
# azurerm_virtual_machine
win10_vm_size                       = "Standard_B2ms"
# azurerm_virtual_machine_os_profile
win10_admin_username                = "<USERNAME>"
win10_admin_password                = "<PASSWORD>"
# azurerm_virtual_machine_os_profile_windows_config
win10_enable_automatic_upgrades     = "false"
win10_timezone                      = "Eastern Standard Time"
# azurerm_virtual_machine_storage_image_reference
win10_publisher                     = "microsoftvisualstudio"
win10_offer                         = "Windows"
win10_sku                           = "Windows-10-N-x64"
win10_version                       = "latest"
# azurerm_virtual_machine_storage_os_disk
win10_os_type                       = "Windows"
win10_create_option                 = "FromImage"
win10_managed_disk_type             = "Standard_LRS"

#---- Windows 7 client variables ----#
# Number of clients
win7_count = 1
# azurerm_storage_account
win7_account_replication_type      = "LRS"
win7_account_tier                  = "Standard"
# azure_public_ip
win7_public_ip_address_allocation  = "static"
win7_private_ip_address_allocation = "dynamic"
# azurerm_virtual_machine
win7_vm_size                       = "Standard_B2s"
# azurerm_virtual_machine_os_profile
win7_admin_username                = "<USERNAME>"
win7_admin_password                = "<PASSWORD>"
# azurerm_virtual_machine_os_profile_windows_config
win7_enable_automatic_upgrades     = "false"
win7_timezone                      = "Eastern Standard Time"
# azurerm_virtual_machine_storage_image_reference
win7_publisher                     = "microsoftvisualstudio"
win7_offer                         = "Windows"
win7_sku                           = "Win7-SP1-Ent-N-x64"
win7_version                       = "latest"
# azurerm_virtual_machine_storage_os_disk
win7_os_type                       = "Windows"
win7_create_option                 = "FromImage"
win7_managed_disk_type             = "Standard_LRS"

#---- Windows Server 2016 variables ----#
# Number of servers
srv2016_count = 1
# azurerm_storage_account
srv2016_account_replication_type      = "LRS"
srv2016_account_tier                  = "Standard"
# azure_public_ip
srv2016_public_ip_address_allocation  = "static"
srv2016_private_ip_address_allocation = "dynamic"
# azurerm_virtual_machine
srv2016_vm_size                       = "Standard_B2ms"
# azurerm_virtual_machine_os_profile
srv2016_admin_username                = "<USERNAME>"
srv2016_admin_password                = "<PASSWORD>"
# azurerm_virtual_machine_os_profile_windows_config
srv2016_enable_automatic_upgrades     = "false"
srv2016_timezone                      = "Eastern Standard Time"
# azurerm_virtual_machine_storage_image_reference
srv2016_publisher                     = "MicrosoftWindowsServer"
srv2016_offer                         = "WindowsServer"
srv2016_sku                           = "2016-Datacenter"
srv2016_version                       = "latest"
# azurerm_virtual_machine_storage_os_disk
srv2016_os_type                       = "Windows"
srv2016_create_option                 = "FromImage"
srv2016_managed_disk_type             = "Premium_LRS"