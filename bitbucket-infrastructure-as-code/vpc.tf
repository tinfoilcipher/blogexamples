#--Provision VPC
resource "aws_vpc" "tinfoil_vpc" {
    cidr_block = var.vpc_address_space
    tags = {
        Name        = "VPC-${var.environment_name}"
        Environment = var.environment_name
    }
}

#--Provision Subnets
resource "aws_subnet" "tinfoil_bastion" {
    vpc_id                  = aws_vpc.tinfoil_vpc.id
    cidr_block              = var.bastion_cidr
    map_public_ip_on_launch = "true"
    tags = {
        Name        = "BastionSubnet-${var.environment_name}"
        Environment = var.environment_name
    }
}

resource "aws_subnet" "tinfoil_private" {
    vpc_id                  = aws_vpc.tinfoil_vpc.id
    cidr_block              = var.private_cidr
    map_public_ip_on_launch = "false"
    tags = {
        Name        = "PrivateSubnet-${var.environment_name}"
        Environment = var.environment_name
    }
}

#--Provision Gateways
resource "aws_internet_gateway" "tinfoil_igw" {
    vpc_id = aws_vpc.tinfoil_vpc.id
    tags = {
        Name        = "IGW-${var.environment_name}"
        Environment = var.environment_name
    }
}

resource "aws_eip" "tinfoil_nat" {
    vpc = true
    tags = {
        Name        = "EIP-NATGW-${var.environment_name}"
        Environment = var.environment_name
    }
}

resource "aws_nat_gateway" "tinfoil_ngw" {
    allocation_id = aws_eip.tinfoil_nat.id
    subnet_id     = aws_subnet.tinfoil_bastion.id
    tags = {
        Name        = "NATGW-${var.environment_name}"
        Environment = var.environment_name
    }
    depends_on    = [
        aws_internet_gateway.tinfoil_igw
    ]
}

#--Provision Route Tables
resource "aws_route_table" "tinfoil_bastion" {
    vpc_id = aws_vpc.tinfoil_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tinfoil_igw.id
    }
    tags = {
        Name        = "BastionRouteTable-${var.environment_name}"
        Environment = var.environment_name
    }
}

resource "aws_route_table_association" "tinfoil_bastion" {
    subnet_id      = aws_subnet.tinfoil_bastion.id
    route_table_id = aws_route_table.tinfoil_bastion.id
}

resource "aws_route_table" "tinfoil_private" {
    vpc_id = aws_vpc.tinfoil_vpc.id
    route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.tinfoil_ngw.id
    }
    tags = {
        Name        = "PrivateRouteTable-${var.environment_name}"
        Environment = var.environment_name
    }
}

resource "aws_route_table_association" "tinfoil_private" {
    subnet_id      = aws_subnet.tinfoil_private.id
    route_table_id = aws_route_table.tinfoil_private.id
}