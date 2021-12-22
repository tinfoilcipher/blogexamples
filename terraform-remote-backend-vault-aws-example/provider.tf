provider "aws" {
    region          = var.region
    access_key      = data.vault_generic_secret.aws_credentials["aws_access_key_id"]
    secret_key      = data.vault_generic_secret.aws_credentials["aws_secret_access_key"]
}

provider "vault" {
    skip_tls_verify = false
}
