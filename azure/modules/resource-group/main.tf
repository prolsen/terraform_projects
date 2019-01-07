# https://github.com/terraform-providers/terraform-provider-azurerm/tree/master/examples/vm-joined-to-active-directory

resource "azurerm_resource_group" "main" {
        name     = "${var.resource_group_name}"
        location = "${var.location}"

        tags {
                environment = "DFIR Lab Environment"
        }
}