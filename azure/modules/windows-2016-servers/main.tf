#---- Import resource group module ----#
module "resource-group" {
        source                  = "../resource-group"
        prefix                  = "${var.prefix}"
        location                = "${var.location}"
        resource_group_name     = "${var.resource_group_name}"
}

#---- Unique storage account name ----#
resource "random_id" "randomId" {
        keepers = {
                resource_group_name   = "${module.resource-group.resource_group_name}"
        }
        byte_length                   = 8
}

#---- Create storage account ----#
resource "azurerm_storage_account" "server_storage" {
    name                              = "srv2016${random_id.randomId.hex}"
    resource_group_name               = "${module.resource-group.resource_group_name}"
    location                          = "${var.location}"
    account_replication_type          = "${var.srv2016_account_replication_type}"
    account_tier                      = "${var.srv2016_account_tier}"
}

#---- Create public IP ----#
resource "azurerm_public_ip" "server_pip" {
        count                        = "${var.srv2016_count}"
        name                         = "${var.prefix}-srv16-pip-${count.index}"
        location                     = "${var.location}"
        resource_group_name          = "${module.resource-group.resource_group_name}"
        public_ip_address_allocation = "${var.srv2016_public_ip_address_allocation}"
}

#---- Create network interface for servers ----#
resource "azurerm_network_interface" "server_nic" {
        count                        = "${var.srv2016_count}"
        name                         = "${var.prefix}-srv16-nic-${count.index}"
        location                     = "${var.location}"
        resource_group_name          = "${module.resource-group.resource_group_name}"

        ip_configuration {
                name                          = "${var.prefix}-srv16-nic-ipconfig-${count.index}"
                subnet_id                     = "${var.server_subnet_id}"
                private_ip_address_allocation = "${var.srv2016_private_ip_address_allocation}"
                public_ip_address_id          = "${azurerm_public_ip.server_pip.*.id[count.index]}"
        }

	depends_on = ["azurerm_public_ip.server_pip"]
}

#---- Create virtual machine(s) ----#
resource "azurerm_virtual_machine" "server_vm" {
        count                             = "${var.srv2016_count}"
        name                              = "${var.prefix}-srv16-${count.index}"
        location                          = "${var.location}"
        resource_group_name               = "${module.resource-group.resource_group_name}"
        network_interface_ids             = ["${azurerm_network_interface.server_nic.*.id[count.index]}"]
        vm_size                           = "${var.srv2016_vm_size}"

        os_profile {
                computer_name             = "srv16-${count.index}"
                admin_username            = "${var.srv2016_admin_username}"
                admin_password            = "${var.srv2016_admin_password}"
        }

        os_profile_windows_config {
		enable_automatic_upgrades = "${var.srv2016_automatic_upgrades}"
		timezone                  = "${var.srv2016_timezone}"
        }

        storage_image_reference {
		publisher                 = "${var.srv2016_publisher}"
		offer                     = "${var.srv2016_offer}"
		sku                       = "${var.srv2016_sku}"
                version                   = "${var.srv2016_rel_version}"
        }

        storage_os_disk {
		os_type                   = "${var.srv2016_os_type}"
		name                      = "srv16-${count.index}-disk"
		create_option             = "${var.srv2016_create_option}"
		managed_disk_type         = "${var.srv2016_managed_disk_type}"
        }

        tags {
		environment               = "Windows Server 2016 ${var.prefix} Environment"
        }

        depends_on                        = ["azurerm_public_ip.server_pip"]
}