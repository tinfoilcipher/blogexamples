#--Provision Bastion Host
resource "aws_instance" "tinfoil_bastion" {
    ami                         = data.aws_ami.tinfoil_ubuntu.id
    instance_type               = "t2.micro"
    key_name                    = "tinfoilkey"
    subnet_id                   = aws_subnet.tinfoil_bastion.id
    vpc_security_group_ids      = [aws_security_group.tinfoil_bastion.id]
    tags = {
        Name        = "Bastion-${var.environment_name}"
        Environment = var.environment_name
    }
}

#--Provision Private Nodes
resource "aws_instance" "tinfoil_private" {
    count                       = var.private_ec2_nodes
    ami                         = data.aws_ami.tinfoil_ubuntu.id
    instance_type               = "t2.micro"
    key_name                    = "tinfoilkey"
    subnet_id                   = aws_subnet.tinfoil_private.id
    vpc_security_group_ids      = [aws_security_group.tinfoil_private.id]
    tags = {
        Name        = "Node-${var.environment_name}${count.index}"
        Environment = var.environment_name
    }
}