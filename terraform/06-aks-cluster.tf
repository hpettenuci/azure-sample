resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${azurerm_resource_group.aks_rg.name}-cluster"
  dns_prefix          = azurerm_resource_group.aks_rg.name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  kubernetes_version  = data.azurerm_kubernetes_service_versions.aks_version.latest_version
  node_resource_group = "${azurerm_resource_group.aks_rg.name}-nrg"

  default_node_pool {
    name                 = var.aks_node_data["name"]
    vm_size              = var.aks_node_data["vm_size"]
    orchestrator_version = data.azurerm_kubernetes_service_versions.aks_version.latest_version
    availability_zones   = var.aks_node_data["availability_zones"]
    enable_auto_scaling  = var.aks_node_data["enable_auto_scaling"]
    max_count            = var.aks_node_data["min_count"]
    min_count            = var.aks_node_data["max_count"]
    os_disk_size_gb      = var.aks_node_data["os_disk_size_gb"]
    type                 = var.aks_node_data["type"]
    node_labels = {
      "nodepool-type" = "system"
      "environment"   = var.info_environment
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
    tags = {
      "nodepool-type" = "system"
      "environment"   = var.info_environment
      "nodepoolos"    = "linux"
      "app"           = "system-apps"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  # Add log analytics
  addon_profile {
    azure_policy {
      enabled = true
    }
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
    }
  }

  # Azure AD integration with RBAC
  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed                = true
      admin_group_object_ids = [azuread_group.aks_admin.id]
    }
  }

  # Windows admin profile
  windows_profile {
    admin_username = var.win_admin_username
    admin_password = var.win_admin_password
  }

  # Linux admin profile
  linux_profile {
    admin_username = var.linux_admin_username
    ssh_key {
      key_data = var.linux_admin_ssh_key
    }
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "azure"
  }

}