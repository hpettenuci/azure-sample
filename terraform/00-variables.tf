# Azure Auth Info
variable "az_subscription_id" {
    type        = string
    description = "Azure Subscription ID"
    sensitive = true
}
variable "az_client_id" {
    type        = string
    description = "Azure Client ID"
    sensitive = true
}
variable "az_client_secret" {
    type        = string
    description = "Azure Client Secret"
    sensitive = true
}
variable "az_tenant_id" {
    type        = string
    description = "Azure Tenant ID"
    sensitive = true
}

# General Variables
variable "info_project" {    
    description = "Project Name"
    type = string
}
variable "info_environment" {    
    description = "Environment Info"
    type = string
}

# Azure General Variables
variable "az_location" {
    description = "Azure Location"
    type = string
}
variable "az_analytics_retention" {
    description = "Azure Log Analytics Workspace"
    type = number
}

# AKS Variables
variable "aks_node_data" {
    description = "AKS Node Pool"
    type = object({
        name = string
        vm_size = string
        availability_zones = list(number)
        enable_auto_scaling = string
        min_count = number
        max_count = number
        os_disk_size_gb = number
        type = string
        
    })
}
variable "win_admin_username" {
    description = "Windows Admin User"
    type = string
}
variable "win_admin_password" {
    description = "Windows Admin Password"
    type = string
    sensitive = true
}
variable "linux_admin_username" {
    description = "Linux Admin User"
    type = string
}
variable "linux_admin_ssh_key" {
    description = "Linux Admini SSH Key"
    sensitive = true
}