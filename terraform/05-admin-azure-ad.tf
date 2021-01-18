resource "azuread_group" "aks_admin" {
    display_name    = "${azurerm_resource_group.aks_rg.name}-administrator"
    description     = "Azure AKS K8s administrator for ${azurerm_resource_group.aks_rg.name} cluster."
}