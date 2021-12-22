#--Terraform Configuration
terraform {
    backend "s3" {
        bucket          = "tinfoil-terraform-backend"
        key             = "ec2_build.tfstate"
        region          = "eu-west-2"
        dynamodb_table  = "tinfoil_tf_state_locking"
    }
    required_providers {
        mycloud = {
            source  = "hashicorp/aws"
            version = "= 3.27"
        }
    }
}

#--AMI Lookup
data "aws_ami" "tinfoil_ubuntu" {
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