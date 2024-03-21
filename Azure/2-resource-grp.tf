resource "azurerm_resource_group" "capstone" {
  name     = local.resource_group_name
  location = local.region
}