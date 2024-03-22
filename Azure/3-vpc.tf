resource "azurerm_virtual_network" "eks-vnet" {
  name                = "eks-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.capstone.location
  resource_group_name = azurerm_resource_group.capstone.name

  tags = {
    env = local.env
  }
}