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
        values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
    }
    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"] # Canonical
}

resource "aws_instance" "tinfoil" {
    ami                     = data.aws_ami.tinfoil.id
    instance_type           = "t2.micro"
    key_name                = "tinfoil-key"
    subnet_id               = "subnet-02beca82af6553e64"
    count                   =  4
    tags = {
        Resource = "Compute"
    }
}
