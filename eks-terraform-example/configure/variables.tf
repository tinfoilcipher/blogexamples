#--Default AWS Region
variable "region" {
    type        = string
    description = "Primary Location"
    default     = "eu-west-2"
}

# Namespace Names
variable "namespace_names" {
    description = "All Namespace Names"
    type        = list(string)
    default     = ["operations",
                  "development",
                  "uat"]
}
