output "private_subnet_ids" {
  value       = data.aws_subnets.private_subnets.ids
  description = "Private Subnet IDs"
}

output "public_subnet_ids" {
  value       = data.aws_subnets.public_subnets.ids
  description = "Public Subnet IDs"
}

output "private_subnet_cidrs" {
  value       = data.aws_subnet.private_subnets[*].cidr_block
  description = "Private Subnet CIDRs"
}

output "public_subnet_cidrs" {
  value       = data.aws_subnet.public_subnets[*].cidr_block
  description = "Public Subnet CIDRs"
}
