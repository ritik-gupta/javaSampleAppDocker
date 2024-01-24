# Define Terraform backend using a blob storage container on Microsoft Azure for storing the Terraform state
# terraform {
#   backend "azurerm" {
#   }
# }

# Set the Azure Provider source and version being used
terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.76.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = "true"
}