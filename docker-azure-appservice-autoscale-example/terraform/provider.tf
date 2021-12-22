provider "azurerm" {
    version = "=2.1.0"
    features {}
    subscription_id = var.subscription_id
    tenant_id       = var.tenant_id
    client_id       = var.client_id
    client_secret   = var.client_secret
}

provider "local" {}
