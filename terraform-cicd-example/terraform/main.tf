terraform {
    backend "s3" {
        bucket       = "tinfoilterraformbackend"
        key          = "terraform.tfstate"
        region       = "eu-west-2"
    }
}

data "aws_ami" "tinfoil" {
    most_recent = true
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"] # Canonical
}

resource "aws_instance" "tinfoil" {
    count               = length(var.no_instances)
    ami                 = data.aws_ami.tinfoil.id
    instance_type       = "t2.micro"
    key_name            = "tinfoil-key"
    subnet_id           = "subnet-01234567890abcdef"
    security_groups     = ["sg-01234567890"]
    count               =  var.no_instances
    tags                = {
        Name = "instance-${count.index}"
    }
}