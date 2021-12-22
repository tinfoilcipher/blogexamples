#--main.tf

#--Master Node
resource "aws_eks_cluster" "tinfoil" {
    name     = var.cluster_group_names[0]
    role_arn = var.cluster_arn
    version  = "1.15"
    vpc_config {
        subnet_ids = var.subnet_ids
    }
}

#--Worker Nodes
resource "aws_eks_node_group" "tinfoil" {
    cluster_name    = aws_eks_cluster.tinfoil.name
    count           = length(var.node_group_names)
    node_group_name = var.node_group_names[count.index]
    node_role_arn   = var.node_arn
    subnet_ids      = var.subnet_ids
    instance_types  = ["t3.medium"]

    scaling_config {
        desired_size = 1
        max_size     = 2
        min_size     = 1
    }
}
