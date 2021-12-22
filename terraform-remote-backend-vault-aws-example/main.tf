#--BACKEND
terraform {
    backend "s3" {
        bucket = "YOUR_BUCKET_NAME"
        key    = "ec2_build.tfstate"
        region = "eu-west-2"
    }
}

# Lookup Vault Secrets - Provided to provider.tf
data "vault_generic_secret" "aws_credentials" {
    path = "kv/aws_credentials"
}

#--PROVISIONING
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
    ami                     = data.aws_ami.tinfoil.id
    instance_type           = "t2.micro"
    key_name                = "tinfoil-key"
    count                   =  10
    tags = {
        Resource = "Compute"
    }
}
