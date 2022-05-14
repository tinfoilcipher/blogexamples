#--Example Code - Provision Simple Public Network
resource "aws_vpc" "vpc" {
    cidr_block              = var.vpc_address_space
    enable_dns_support      = true
    enable_dns_hostnames    = true
    tags                    = {
        Name = "VPC-${var.environment_name}"
    }
}

resource "aws_subnet" "public_subnets" {
    count                   = length(data.aws_availability_zones.available.names)
    vpc_id                  = aws_vpc.vpc.id
    availability_zone       = data.aws_availability_zones.available.names[count.index]
    cidr_block              = var.subnet_cidrs[count.index]
    map_public_ip_on_launch = "true"
    tags                    = {
        Name = "PublicSubnet${count.index}-${var.environment_name}"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id      = aws_vpc.vpc.id
    tags    = {
        Name = "IGW-${var.environment_name}"
    }
}

resource "aws_route_table" "public_route" {
    vpc_id      = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags    = {
        Name = "PublicRouteTable-${var.environment_name}"
    }
}