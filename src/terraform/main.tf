terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }

 backend "azurerm" {
    resource_group_name  = "TFbuild"
    storage_account_name = "sureshtfstate"
    container_name       = "tfstate"
    key                  = "demo.terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  # subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  # tenant_id       = var.tenant_id
}


# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "demo-rg"
  location = "East US"
  tags =  {
    env = "dev"
    cost = "TA102AXY"
  }
}