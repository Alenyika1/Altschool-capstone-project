resource "azurerm_resource_group" "capstone" {
  name     = local.resource_group_name
  location = local.region
}


resource "azurerm_dns_zone" "wwww" {
  name                = "alenyika.com.ng"
  resource_group_name = azurerm_resource_group.capstone.name
}
