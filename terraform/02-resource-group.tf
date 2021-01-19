resource "azurerm_resource_group" "aks_rg" {
  name     = "${var.info_project}-${var.info_environment}"
  location = var.az_location
}