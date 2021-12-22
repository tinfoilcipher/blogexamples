# Define Vault Connection Params
provider "vault" {
    address         = var.vault_url
    skip_tls_verify = false
    token           = var.vault_token
}

# Define Azure Connection Params
provider "azurerm" {
    version = "=2.1.0"
    features {}
    subscription_id = data.vault_generic_secret.kv-azuresp.data["subscription_id"]
    tenant_id       = data.vault_generic_secret.kv-azuresp.data["tenant_id"]
    client_id       = data.vault_generic_secret.kv-azuresp.data["client_id"]
    client_secret   = data.vault_generic_secret.kv-azuresp.data["client_secret"]
}
