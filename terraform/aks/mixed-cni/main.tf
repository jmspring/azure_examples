# Add providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.89"
    }
    random = {
      source = "hashicorp/random"
      version = "~>3.1"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Data items
data "azurerm_resource_group" "mixed_cni" {
  name = var.resource_group_name
}

# Name setup
resource "random_string" "mixed_cni" {
  length           = 6
  lower            = true
  special          = false
  upper            = false
  number           = false
}

locals {
  base_name = "${var.base_name_prefix}-${random_string.mixed_cni.result}"
}