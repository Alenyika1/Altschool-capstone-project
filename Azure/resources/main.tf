resource "azurerm_resource_group" "capstone" {
  name     = "${var.prefix}capstone"
  location = var.location
}