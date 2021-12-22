provider "aws" {
    region      = var.region
    access_key  = var.access_key
    secret_key  = var.secret_key
}

data "aws_eks_cluster" "tinfoil" {
    name = "tinfoilcluster"
}

#--EKS Token Lookup
data "aws_eks_cluster_auth" "tinfoil" {
    name = "tinfoilcluster"
}

provider "kubernetes" {
    host                   = data.aws_eks_cluster.tinfoilcluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.tinfoilcluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.tinfoilcluster.token
    load_config_file       = false
}
