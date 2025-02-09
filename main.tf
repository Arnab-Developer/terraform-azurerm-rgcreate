locals {
  applications = flatten([
    for application_name in var.application_names : [
      for environment_name in var.environment_names : {
        name                 = "rg-${application_name}-${environment_name}"        
        location             = environment_name == "prod" ? var.locations.primary : var.locations.secondary
        work_force           = environment_name == "prod" ? "production" : "non-production"
        has_developer_access = environment_name == "prod" ? "no" : "yes"
      }
    ]
  ])

  applications_map = {
    for index, application in local.applications : index => application
  }
}

resource "azurerm_resource_group" "main" {
  for_each = applications_map

  name     = each.value.name
  location = each.value.location

  tags = {
    work_force           = each.value.work_force
    has_developer_access = each.value.has_developer_access
  }
}
