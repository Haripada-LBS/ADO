# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

terraform {
    backend "azurerm" {
        resource_group_name     = "test-rg"    
        storage_account_name    = "teststg8904"
        container_name          = "testcontainer"
        key                     = "terraform.tfstate"
    }
}

# Create Resource Group
resource "azurerm_resource_group" "tamops" {
  name     = var.resource_group_name
  location = var.location
}