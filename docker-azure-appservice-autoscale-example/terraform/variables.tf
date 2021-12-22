###############################
#---Azure Connection Params---#
###############################

#--Primary Location
variable "location" {
    type        = string
    description = "Primary Location"
    default      = "eastus"
}

#--Subscription
variable "subscription_id" {
    type        = string
    description = "Subscription id"
}

#--Tenant
variable "tenant_id" {
    type        = string
    description = "Tenant id"
}

##############################
#---Auth and Secret Params---#
##############################

#--Service Principle AppID
variable "client_id" {
    type        = string
    description = "Client id"
}

#--Service Principle Secret
variable "client_secret" {
    type        = string
    description = "Client secret"
}

####################
#---Build Params---#
####################

#--Resource Groups
variable "resource_group" {
    description = "All resource groups"
    type        = string
    default     = "tinfoil_containers_rg"
}

#--App Prefix
variable "container_prefix" {
    description = "Common Prefix for Container Resources"
    type        = string
    default     = "tinfoil-app"
}
