# Vault URL
variable "vault_url" {
    description = "Vault URL"
    type        = string
    default     = "https://<YOUR_VAULT_HOST_OR_IP>:8200"
}

# Vault Token
variable "vault_token" {
    description = "Vault Token"
    type        = string
}

#--Resource Groups
variable "secret_keys" {
    description = "Keys (Names) For Secrets"
    type        = list(string)
    default     = ["DefaultLinuxAdmin",
                 "DefaultWindowsAdmin",
                 "DefaultDBAdmin",
                 "DefaultFWAdmin",
                 "ServicePrincipalSecret"]
}
