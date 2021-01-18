output "location" {
    value = azurerm_resource_group.aks_rg.location
}

output "resource_group_id" {
    value = azurerm_resource_group.aks_rg.id
}

output "resource_group_name" {
    value = azurerm_resource_group.aks_rg.name
}

output "versions" {
    value = data.azurerm_kubernetes_service_versions.aks_version.versions
}

output "latest_version" {
    value = data.azurerm_kubernetes_service_versions.aks_version.latest_version
}

output "azure_ad_group_id" {
    value = azuread_group.aks_admin.id
}

output "azure_ad_group_objectid" {
    value = azuread_group.aks_admin.object_id 
}

output "aks_cluster_id" {
    value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_cluster_name" {
    value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "aks_cluster_kubernetes_version" {
    value = azurerm_kubernetes_cluster.aks_cluster.kubernetes_version
}