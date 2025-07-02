terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"

    }
  }

  backend "azurerm" {
    resource_group_name  = "statefile_backup_SG"
    storage_account_name = "statefilebackuponly"
    container_name       = "statefilebysg"
    key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id # Replace with your Azure subscription ID
}