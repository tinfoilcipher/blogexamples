resource "aws_vpc" "tinfoil" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "tinfoil" {
  count             = length(var.subnet_cidrs)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.tinfoil.id
  cidr_block        = var.subnet_cidrs[count.index]
  tags = {
    Name = "tinfoil-subnet-${count.index}"
  }
}