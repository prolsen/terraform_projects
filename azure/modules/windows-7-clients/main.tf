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
resource "azurerm_storage_account" "client_storage" {
    name                              = "win7${random_id.randomId.hex}"
    resource_group_name               = "${module.resource-group.resource_group_name}"
    location                          = "${var.location}"
    account_replication_type          = "${var.win7_account_replication_type}"
    account_tier                      = "${var.win7_account_tier}"
}

#---- Create public IP ----#
resource "azurerm_public_ip" "client_pip" {
        count                        = "${var.win7_count}"
        name                         = "${var.prefix}-win7-pip-${count.index}"
        location                     = "${var.location}"
        resource_group_name          = "${module.resource-group.resource_group_name}"
        public_ip_address_allocation = "${var.win7_public_ip_address_allocation}"
}

#---- Create network interface for clients ----#
resource "azurerm_network_interface" "client_nic" {
        count                        = "${var.win7_count}"
        name                         = "${var.prefix}-win7-nic-${count.index}"
        location                     = "${var.location}"
        resource_group_name          = "${module.resource-group.resource_group_name}"

        ip_configuration {
                name                          = "${var.prefix}-win7-nic-ipconfig-${count.index}"
                subnet_id                     = "${var.client_subnet_id}"
                private_ip_address_allocation = "${var.win7_private_ip_address_allocation}"
                public_ip_address_id          = "${azurerm_public_ip.client_pip.*.id[count.index]}"
        }

	depends_on = ["azurerm_public_ip.client_pip"]
}

#---- Create virtual machine(s) ----#
resource "azurerm_virtual_machine" "client_vm" {
        count                             = "${var.win7_count}"
        name                              = "${var.prefix}-win7-${count.index}"
        location                          = "${var.location}"
        resource_group_name               = "${module.resource-group.resource_group_name}"
        network_interface_ids             = ["${azurerm_network_interface.client_nic.*.id[count.index]}"]
        vm_size                           = "${var.win7_vm_size}"

        os_profile {
                computer_name             = "win7-${count.index}"
                admin_username            = "${var.win7_admin_username}"
                admin_password            = "${var.win7_admin_password}"
        }

        os_profile_windows_config {
		enable_automatic_upgrades = "${var.win7_automatic_upgrades}"
		timezone                  = "${var.win7_timezone}"
        }

        storage_image_reference {
		publisher                 = "${var.win7_publisher}"
		offer                     = "${var.win7_offer}"
		sku                       = "${var.win7_sku}"
                version                   = "${var.win7_rel_version}"
        }

        storage_os_disk {
		os_type                   = "${var.win7_os_type}"
		name                      = "win7-${count.index}-disk"
		create_option             = "${var.win7_create_option}"
		managed_disk_type         = "${var.win7_managed_disk_type}"
        }

        tags {
		environment               = "Windows 7 ${var.prefix} Environment"
        }

        depends_on                        = ["azurerm_public_ip.client_pip"]
}
