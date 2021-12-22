# Backend configuration. Configure the storage_account_name as per your own taxonomy

terraform {
    backend "azurerm" {
        resource_group_name   = "tinfoil_storage_rg"
        storage_account_name  = "tinfoilterraformbackend"
        container_name        = "tstate"
        key                   = "terraform.tfstate"
    }
}

# Lookup Vault Secrets - Intended to lookup secrets named azure_terraform_service_principal and
# azure_new_db from a KV type Secret Engine named kv. Each secret contains multiple KVPs

data "vault_generic_secret" "kv-azuresp" {
    path = "kv/azure_terraform_service_principal"
}

data "vault_generic_secret" "kv-azuredb" {
    path = "kv/azure_newdb_creds"
}

# Create Resource Group
resource "azurerm_resource_group" "tinfoil" {
    name        = var.resource_group
    location    = var.location
    tags = {
        Resource = "Group"
    }
}

#--Create Database Servers
resource "azurerm_sql_server" "tinfoil" {
    name                         = var.sql_database_server
    resource_group_name          = var.resource_group
    location                     = var.location
    version                      = "12.0"
    administrator_login          = data.vault_generic_secret.kv-azuredb.data["username"]
    administrator_login_password = data.vault_generic_secret.kv-azuredb.data["password"]
    tags = {
        Resource = "Database"
    }
}

#--Create SQL Databases
resource "azurerm_sql_database" "tinfoil" {
    name                  = var.sql_databases[count.index]
    count                 = length(var.sql_databases)
    resource_group_name   = var.resource_group
    location              = var.location
    server_name           = var.sql_database_server
    tags = {
        Resource = "Database"
    }
}
