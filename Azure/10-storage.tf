resource "random_integer" "capstone" {
  min = 10000
  max = 5000000
}

resource "azurerm_storage_account" "capstone" {
  name                     = "devtest${random_integer.capstone.result}"
  resource_group_name      = azurerm_resource_group.capstone.name
  location                 = azurerm_resource_group.capstone.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "capstone" {
  name                  = "test"
  storage_account_name  = azurerm_storage_account.capstone.name
  container_access_type = "private"
}

resource "azurerm_role_assignment" "dev_test" {
  scope                = azurerm_storage_account.capstone.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.capstone.principal_id
}