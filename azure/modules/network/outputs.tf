output "virtual_network_address_space" {
  value = "${azurerm_virtual_network.main.address_space}"
}

output "clients_subnet_address" {
  value = "${azurerm_subnet.clients.address_prefix}"
}

output "servers_subnet_address" {
  value = "${azurerm_subnet.servers.address_prefix}"
}

output "virtual_network_name" {
  value = "${azurerm_virtual_network.main.name}"
}

output "client_subnet_id" {
  value = "${azurerm_subnet.clients.id}"
}

output "server_subnet_id" {
  value = "${azurerm_subnet.servers.id}"
}