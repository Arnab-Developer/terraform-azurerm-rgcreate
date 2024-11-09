run "ResourceGroupsCreatedProperly_GivenValidInput" {
  variables {
    application_names = ["app1", "app2"]
    environment_names = ["dev", "prod"]

    locations = {
      primary   = "northeurope"
      secondary = "eastus"
    }
  }

  command = plan

  assert {
    condition     = azurerm_resource_group.main[0].name == "rg-app1-dev"
    error_message = "Invalid app1 resource group name."
  }

  assert {
    condition     = azurerm_resource_group.main[0].location == "eastus"
    error_message = "Invalid app1 resource group location."
  }

  assert {
    condition     = azurerm_resource_group.main[1].name == "rg-app1-prod"
    error_message = "Invalid app1 resource group name."
  }

  assert {
    condition     = azurerm_resource_group.main[1].location == "northeurope"
    error_message = "Invalid app1 resource group location."
  }

  assert {
    condition     = azurerm_resource_group.main[2].name == "rg-app2-dev"
    error_message = "Invalid app2 resource group name."
  }

  assert {
    condition     = azurerm_resource_group.main[2].location == "eastus"
    error_message = "Invalid app2 resource group location."
  }

  assert {
    condition     = azurerm_resource_group.main[3].name == "rg-app2-prod"
    error_message = "Invalid app2 resource group name."
  }

  assert {
    condition     = azurerm_resource_group.main[3].location == "northeurope"
    error_message = "Invalid app2 resource group location."
  }
}
