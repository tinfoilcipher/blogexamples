#--variables.tf

#--AWS Authentication
variable "access_key" {
    type        = string
    description = "Access Key"
}

variable "secret_key" {
    type        = string
    description = "Secret Key"
}

variable "cluster_arn" {
    type        = string
    description = "Cluster ARN"
}

variable "node_arn" {
    type        = string
    description = "Node ARN"
}

#--Default AWS Region
variable "region" {
    type        = string
    description = "Primary Location"
    default     = "eu-west-2"
}

#--Subnet IDs - Enter Two Subnets IDs in Two Different Availablity Zones
variable "subnet_ids" {
    description = "All Subnet IDs"
    type        = list(string)
    default     = ["subnet-XXXXXXXXXXXXXXXX",
                  "subnet-XXXXXXXXXXXXXXXX"]
}

#--All Cluster Names
variable "cluster_group_names" {
    description = "All Cluster Names"
    type        = list(string)
    default     = ["tinfoilcluster"]
}

#--Node Group Names (Source Cluster)
variable "node_group_names" {
    description = "All Node Group Names"
    type        = list(string)
    default     = ["tinfoil_node_group_1",
                  "tinfoil_node_group_2"]
}
