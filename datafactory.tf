resource "azurerm_data_factory" "adf" {
  name                            = var.datafactory_name
  location                        = var.location
  public_network_enabled          = true
  resource_group_name             = var.resourcegroupname
  managed_virtual_network_enabled = true
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}

resource "azurerm_data_factory_integration_runtime_azure" "auto_resolve_labs" {
  data_factory_id         = azurerm_data_factory.adf.id
  location                = "Canada Central"
  name                    = ""
  time_to_live_min        = 60
  virtual_network_enabled = true
  cleanup_enabled         = true
  compute_type            = "General"
  core_count              = 8
}

resource "azurerm_data_factory_managed_private_endpoint" "adf" {
  name               = ""
  data_factory_id    = azurerm_data_factory.adf.id
  target_resource_id = ""
  subresource_name   = "databricks_ui_api"
}