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

  # App1 dev asserts

  assert {
    condition     = azurerm_resource_group.main[0].name == "rg-app1-dev"
    error_message = "Invalid app1 dev resource group name."
  }

  assert {
    condition     = azurerm_resource_group.main[0].location == "eastus"
    error_message = "Invalid app1 dev resource group location."
  }

  # App1 prod asserts

  assert {
    condition     = azurerm_resource_group.main[1].name == "rg-app1-prod"
    error_message = "Invalid app1 prod resource group name."
  }

  assert {
    condition     = azurerm_resource_group.main[1].location == "northeurope"
    error_message = "Invalid app1 prod resource group location."
  }

  # App2 dev asserts

  assert {
    condition     = azurerm_resource_group.main[2].name == "rg-app2-dev"
    error_message = "Invalid app2 dev resource group name."
  }

  assert {
    condition     = azurerm_resource_group.main[2].location == "eastus"
    error_message = "Invalid app2 dev resource group location."
  }

  # App2 prod asserts

  assert {
    condition     = azurerm_resource_group.main[3].name == "rg-app2-prod"
    error_message = "Invalid app2 prod resource group name."
  }

  assert {
    condition     = azurerm_resource_group.main[3].location == "northeurope"
    error_message = "Invalid app2 prod resource group location."
  }
}
