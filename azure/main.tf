# https://www.terraform.io/docs/providers/azurerm/
# https://github.com/terraform-providers/terraform-provider-azurerm/tree/master/examples/vm-joined-to-active-directory
# https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9

provider "azure" {
  prefix              = "${var.prefix}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}

# ---- RESOURCE GROUP ----
module "resource-group" {
  source              = "./modules/resource-group"
  prefix              = "${var.prefix}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}

# ---- NETWORK ----
module "network" {
  source                  = "./modules/network"
  prefix                  = "${var.prefix}"
  location                = "${var.location}"
  resource_group_name     = "${var.resource_group_name}"
  address_space           = "${var.virtual_network_address_space}"
  client_address_prefix   = "${var.domain_client_subnet}"
  server_address_prefix   = "${var.domain_server_subnet}"
  source_address_prefixes = "${var.source_address_prefixes}"
}

#---- WINDOWS CLIENTS ----#
#---- WINDOWS 10 ----#
module "windows-10-clients" {
  source                             = "./modules/windows-10-clients"
  prefix                             = "${var.prefix}"
  resource_group_name                = "${var.resource_group_name}"
  location                           = "${var.location}"
  client_subnet_id	                 = "${module.network.client_subnet_id}"
  # Win 10 client variables
  win10_account_replication_type     = "${var.win10_account_replication_type}"
  win10_account_tier                 = "${var.win10_account_tier}"
  win10_public_ip_address_allocation = "${var.win10_public_ip_address_allocation}"
  win10_private_ip_address_allocation= "${var.win10_private_ip_address_allocation}"
  win10_count                        = "${var.win10_count}"
  win10_vm_size                      = "${var.win10_vm_size}"
  win10_admin_username               = "${var.win10_admin_username}"
  win10_admin_password               = "${var.win10_admin_password}"
  win10_automatic_upgrades           = "${var.win10_enable_automatic_upgrades}"
  win10_timezone                     = "${var.win10_timezone}"
  win10_publisher                    = "${var.win10_publisher}"
  win10_offer                        = "${var.win10_offer}"
  win10_sku                          = "${var.win10_sku}"
  win10_rel_version                  = "${var.win10_version}"
  win10_os_type                      = "${var.win10_os_type}"
  win10_create_option                = "${var.win10_create_option}"
  win10_managed_disk_type            = "${var.win10_managed_disk_type}"
}

#---- WINDOWS 7 ----#
module "windows-7-clients" {
  source                             = "./modules/windows-7-clients"
  prefix                             = "${var.prefix}"
  resource_group_name                = "${var.resource_group_name}"
  location                           = "${var.location}"
  client_subnet_id	                 = "${module.network.client_subnet_id}"
  # Win 7 client variables
  win7_account_replication_type     = "${var.win7_account_replication_type}"
  win7_account_tier                 = "${var.win7_account_tier}"
  win7_public_ip_address_allocation = "${var.win7_public_ip_address_allocation}"
  win7_private_ip_address_allocation= "${var.win7_private_ip_address_allocation}"
  win7_count                        = "${var.win7_count}"
  win7_vm_size                      = "${var.win7_vm_size}"
  win7_admin_username               = "${var.win7_admin_username}"
  win7_admin_password               = "${var.win7_admin_password}"
  win7_automatic_upgrades           = "${var.win7_enable_automatic_upgrades}"
  win7_timezone                     = "${var.win7_timezone}"
  win7_publisher                    = "${var.win7_publisher}"
  win7_offer                        = "${var.win7_offer}"
  win7_sku                          = "${var.win7_sku}"
  win7_rel_version                  = "${var.win7_version}"
  win7_os_type                      = "${var.win7_os_type}"
  win7_create_option                = "${var.win7_create_option}"
  win7_managed_disk_type            = "${var.win7_managed_disk_type}"
}

#---- WINDOWS 2016 SERVERS ----#
module "windows-servers" {
  source                             = "./modules/windows-2016-servers"
  prefix                             = "${var.prefix}"
  resource_group_name                = "${var.resource_group_name}"
  location                           = "${var.location}"
  server_subnet_id	                 = "${module.network.server_subnet_id}"
  # Win 2016 server variables
  srv2016_account_replication_type     = "${var.srv2016_account_replication_type}"
  srv2016_account_tier                 = "${var.srv2016_account_tier}"
  srv2016_public_ip_address_allocation = "${var.srv2016_public_ip_address_allocation}"
  srv2016_private_ip_address_allocation= "${var.srv2016_private_ip_address_allocation}"
  srv2016_count                        = "${var.srv2016_count}"
  srv2016_vm_size                      = "${var.srv2016_vm_size}"
  srv2016_admin_username               = "${var.srv2016_admin_username}"
  srv2016_admin_password               = "${var.srv2016_admin_password}"
  srv2016_automatic_upgrades           = "${var.srv2016_enable_automatic_upgrades}"
  srv2016_timezone                     = "${var.srv2016_timezone}"
  srv2016_publisher                    = "${var.srv2016_publisher}"
  srv2016_offer                        = "${var.srv2016_offer}"
  srv2016_sku                          = "${var.srv2016_sku}"
  srv2016_rel_version                  = "${var.srv2016_version}"
  srv2016_os_type                      = "${var.srv2016_os_type}"
  srv2016_create_option                = "${var.srv2016_create_option}"
  srv2016_managed_disk_type            = "${var.srv2016_managed_disk_type}"
}

# ---- OUTPUTS ----
output "prefix" {
  value  = "${var.prefix}"
}
output "location" {
  value = "${var.location}"
}
output "resource_group_name" {
  value = "${var.resource_group_name}"
}
output "address_space" {
  value = "${var.virtual_network_address_space}"
}
output "client_address_prefix" {
  value = "${var.domain_client_subnet}"
}
output "server_address_prefix" {
  value = "${var.domain_server_subnet}"
}
output "source_address_prefixes" {
  value = "${var.source_address_prefixes}"
}
output "client_subnet_id" {
  value = "${module.network.client_subnet_id}"
}

output "server_subnet_id" {
  value = "${module.network.server_subnet_id}"
}
# ---- Windows 10 client outputs ----#
output "win10_account_replication_type" {
  value = "${var.win10_account_replication_type}"
}
output "win10_account_tier" {
  value = "${var.win10_account_tier}"
}
output "win10_public_ip_address_allocation" {
  value = "${var.win10_public_ip_address_allocation}"
}
output "win10_private_ip_address_allocation" {
  value = "${var.win10_private_ip_address_allocation}"
}
output "win10_count" {
  value = "${var.win10_count}"
}
output "win10_vm_size" {
  value = "${var.win10_vm_size}"
}
output "win10_enable_automatic_upgrades" {
  value = "${var.win10_enable_automatic_upgrades}"
}
output "win10_timezone" {
  value = "${var.win10_timezone}"
}
output "win10_publisher" {
  value = "${var.win10_publisher}"
}
output "win10_offer" {
  value = "${var.win10_offer}"
}
output "win10_sku" {
  value = "${var.win10_sku}"
}
output "win10_rel_version" {
  value = "${var.win10_version}"
}
output "win10_os_type" {
  value = "${var.win10_os_type}"
}
output "win10_create_option" {
  value = "${var.win10_create_option}"
}

output "win10_managed_disk_type" {
  value = "${var.win10_managed_disk_type}"
}

# ---- Windows Server 7 client outputs ----#
output "win7_account_replication_type" {
  value = "${var.win7_account_replication_type}"
}
output "win7_account_tier" {
  value = "${var.win7_account_tier}"
}
output "win7_public_ip_address_allocation" {
  value = "${var.win7_public_ip_address_allocation}"
}
output "win7_private_ip_address_allocation" {
  value = "${var.win7_private_ip_address_allocation}"
}
output "win7_count" {
  value = "${var.win7_count}"
}
output "win7_vm_size" {
  value = "${var.win7_vm_size}"
}
output "win7_enable_automatic_upgrades" {
  value = "${var.win7_enable_automatic_upgrades}"
}
output "win7_timezone" {
  value = "${var.win7_timezone}"
}
output "win7_publisher" {
  value = "${var.win7_publisher}"
}
output "win7_offer" {
  value = "${var.win7_offer}"
}
output "win7_sku" {
  value = "${var.win7_sku}"
}
output "win7_rel_version" {
  value = "${var.win7_version}"
}
output "win7_os_type" {
  value = "${var.win7_os_type}"
}
output "win7_create_option" {
  value = "${var.win7_create_option}"
}

output "win7_managed_disk_type" {
  value = "${var.win7_managed_disk_type}"
}

# ---- Windows Server 2016 client outputs ----#
output "srv2016_account_replication_type" {
  value = "${var.srv2016_account_replication_type}"
}
output "srv2016_account_tier" {
  value = "${var.srv2016_account_tier}"
}
output "srv2016_public_ip_address_allocation" {
  value = "${var.srv2016_public_ip_address_allocation}"
}
output "srv2016_private_ip_address_allocation" {
  value = "${var.srv2016_private_ip_address_allocation}"
}
output "srv2016_count" {
  value = "${var.srv2016_count}"
}
output "srv2016_vm_size" {
  value = "${var.srv2016_vm_size}"
}
output "srv2016_enable_automatic_upgrades" {
  value = "${var.srv2016_enable_automatic_upgrades}"
}
output "srv2016_timezone" {
  value = "${var.srv2016_timezone}"
}
output "srv2016_publisher" {
  value = "${var.srv2016_publisher}"
}
output "srv2016_offer" {
  value = "${var.srv2016_offer}"
}
output "srv2016_sku" {
  value = "${var.srv2016_sku}"
}
output "srv2016_rel_version" {
  value = "${var.srv2016_version}"
}
output "srv2016_os_type" {
  value = "${var.srv2016_os_type}"
}
output "srv2016_create_option" {
  value = "${var.srv2016_create_option}"
}

output "srv2016_managed_disk_type" {
  value = "${var.srv2016_managed_disk_type}"
}