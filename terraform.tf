terraform {
  required_version = "1.9.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }

  cloud {
    organizations = "[HCP org name]"

    workspaces {
      name = "[HCP workspace name]"
    }
  }
}

provider "azurerm" {
  features {}
}
