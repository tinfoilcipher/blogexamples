provider "vault" {
    address         = var.vault_url
    skip_tls_verify = false
    token           = var.vault_token
}
