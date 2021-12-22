#--Region
variable "region" {
    type        = string
    description = "Primary Location"
    default      = "eu-west-2"
}

# Vault URL
variable "vault_url" {
    description = "Vault URL"
    type        = string
    default     = "https://<your_vault_hostname>:8200"
}

# Vault Token (For Runtime Input)
variable "vault_token" {
    type        = string
    description = "Vault Token"
}
