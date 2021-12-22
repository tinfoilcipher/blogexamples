#--Azure Location
variable "location" {
    description = "Primary Azure Location"
    type        = string
    default     = "eastus"
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

#--Resource Group
variable "resource_group" {
    description = "All resource groups"
    type        = string
    default     = "tinfoil_database_rg"
}

#--Database Server
variable "sql_database_server" {
    description = "Database Server"
    type        = string
    default     = "tinfoil-database-server"
}

#--Databases
variable "sql_databases" {
    description = "All Databases"
    type        = list(string)
    default     = ["tinfoil_database_prod",
                 "tinfoil_database_dev"]
}
