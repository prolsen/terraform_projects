module "resource-group" {
        source = "../resource-group"
        prefix                  = "${var.prefix}"
        location                = "${var.location}"
        resource_group_name     = "${var.resource_group_name}"
}
# Create virtial network
resource "azurerm_virtual_network" "main" {
        name                    = "${var.prefix}-network"
        location                = "${var.location}"
        resource_group_name     = "${module.resource-group.resource_group_name}"
        address_space           = "${var.address_space}"
}

# Create client subnet
resource "azurerm_subnet" "clients" {
        name                      = "${var.prefix}-clients-subnet"
        resource_group_name       = "${module.resource-group.resource_group_name}"
        virtual_network_name      = "${azurerm_virtual_network.main.name}"
        address_prefix            = "${var.client_address_prefix}"
        network_security_group_id = "${azurerm_network_security_group.main-sg.id}"
        
        depends_on                = ["azurerm_virtual_network.main"]
}

# Create client subnet
resource "azurerm_subnet" "servers" {
        name                      = "${var.prefix}-servers-subnet"
        resource_group_name       = "${module.resource-group.resource_group_name}"
        virtual_network_name      = "${azurerm_virtual_network.main.name}"
        address_prefix            = "${var.server_address_prefix}"
        network_security_group_id = "${azurerm_network_security_group.main-sg.id}"
        
        depends_on                = ["azurerm_virtual_network.main"]
}

# Create Network Security Group and Rules
resource "azurerm_network_security_group" "main-sg" {
        name                            = "${var.prefix}-sg"
        location                        = "${var.location}"
        resource_group_name             = "${module.resource-group.resource_group_name}"
        
        security_rule {
                name                    = "RDP"
                priority                = "1001"
                direction               = "Inbound"
                access                  = "Allow"
                protocol                = "Tcp"
                source_port_range       = "*"
                destination_port_range  = "3389"
                source_address_prefixes = "${var.source_address_prefixes}"
                destination_address_prefix = "*"
        },

        security_rule {
                name                    = "SSH"
                priority                = "1002"
                direction               = "Inbound"
                access                  = "Allow"
                protocol                = "Tcp"
                source_port_range       = "*"
                destination_port_range  = "22"
                source_address_prefixes = "${var.source_address_prefixes}"
                destination_address_prefix = "*"
        }
}