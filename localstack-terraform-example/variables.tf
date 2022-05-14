#--Environment Params
variable "environment_name" {
    type    = string
    default = "tinfoil01"
}

#--Network Params
variable "vpc_address_space" {
    type    = string
    default = "10.0.0.0/16"
}

variable "subnet_cidrs" {
    type    = list(string)
    default = ["10.0.10.0/24","10.0.20.0/24","10.0.30.0/24"]
}