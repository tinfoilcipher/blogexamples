#--THIS DATA SOURCE WILL LOOK UP ALL VPC DATA
data "aws_vpc" "vpc" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

#--THIS DATA SOURCE WILL LOOK UP SUBNET IDS FOR SUBNETS TAGGED AS tier: private
data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  tags = {
    "tier" = "private"
  }
}

#--THIS DATA SOURCE WILL LOOK UP SUBNET IDS FOR SUBNETS TAGGED AS tier: public
data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  tags = {
    "tier" = "public"
  }
}

#--THIS DATA SOURCE WILL LOOK UP INDIVIDUAL SUBNET DATA, BASED ON INDIVIDUAL SUBNET ID.
#--USE OF THE COUNT ARGUMENT WILL LOOK UP DATA FOR EACH OF THE SUBNET IDS TAGGED AS tier: private
data "aws_subnet" "private_subnets" {
  count  = length(data.aws_subnets.private_subnets.ids)
  vpc_id = data.aws_vpc.vpc.id
  id     = data.aws_subnets.private_subnets.ids[count.index]
}

#--THIS DATA SOURCE WILL LOOK UP INDIVIDUAL SUBNET DATA, BASED ON INDIVIDUAL SUBNET ID.
#--USE OF THE COUNT ARGUMENT WILL LOOK UP DATA FOR EACH OF THE SUBNET IDS TAGGED AS tier: public
data "aws_subnet" "public_subnets" {
  count  = length(data.aws_subnets.public_subnets.ids)
  vpc_id = data.aws_vpc.vpc.id
  id     = data.aws_subnets.public_subnets.ids[count.index]
}
