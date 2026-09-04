terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "hugtfstorageezra2026"
    container_name       = "hugtfcontainer"
    key                  = "project3/terraform.tfstate"
    use_azuread_auth     = true
  }
}