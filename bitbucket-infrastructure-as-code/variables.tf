#--Input Params
variable "environment_name" {
    type        = string
    description = "Environment Name"
}
variable "vpc_address_space" {
    type        = string
    description = "VPC Address Space (CIDR Format)"
}
variable "bastion_cidr" {
    type        = string
    description = "Bastion Subnet Address Space (CIDR Format)"
}
variable "private_cidr" {
    type        = string
    description = "Private Subnet Address Space (CIDR Format)"
}
variable "wan_edge_ip" {
    type        = string
    description = "Developer Office IP"
}
variable "private_ec2_nodes" {
    type        = number
    description = "Amount of private EC2 nodes to provision"
}