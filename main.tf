locals {
  applications = flatten([
    for application in var.applications : [
      for environment in var.environments : {
        name                 = "rg-${application}-${environment}"        
        location             = environment == "prod" ? var.locations.primary : var.locations.secondary
        work_force           = environment == "prod" ? "production" : "non-production"
        has_developer_access = environment == "prod" ? "no" : "yes"
      }
    ]
  ])
}

resource "azurerm_resource_group" "main" {
  for_each = { for index, application in local.applications : index => application }

  name     = each.value.name
  location = each.value.location

  tags = {
    work_force           = each.value.work_force
    has_developer_access = each.value.has_developer_access
  }
}
