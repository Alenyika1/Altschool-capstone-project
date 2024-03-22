# resource "azurerm_user_assigned_identity" "dev_test" {
#   name                = "dev-test"
#   location            = azurerm_resource_group.capstone.location
#   resource_group_name = azurerm_resource_group.capstone.name
# }

# resource "azurerm_federated_identity_credential" "dev_test" {
#   name                = "dev-test"
#   resource_group_name = local.resource_group_name
#   audience            = ["api://AzureADTokenExchange"]
#   issuer              = azurerm_kubernetes_cluster.eks.oidc_issuer_url
#   parent_id           = azurerm_user_assigned_identity.capstone.id
#   subject             = "system:serviceaccount:dev:my-account"

#   depends_on = [azurerm_kubernetes_cluster.eks]
# }