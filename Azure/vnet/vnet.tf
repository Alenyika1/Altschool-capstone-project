resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}net"
  location            = var.capstone_location
  resource_group_name = var.capstone_name
  address_space       = [ var.address_space ]
}
