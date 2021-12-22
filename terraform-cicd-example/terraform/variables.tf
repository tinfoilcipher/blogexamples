#--Region
variable "region" {
    type        = string
    description = "Primary Location"
    default     = "eu-west-2"
}

variable "no_instances" {
    type        = number
    description = "Number of EC2 Instances"
    default     = 2
}