#--Provision S3 Buckets
resource "aws_s3_bucket" "tinfoil" {
    bucket          = "tinfoilcipherstorage-${var.environment_name}"
    force_destroy   = true
    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm     = "AES256"
            }
        }
    }
    tags = {
        Name        = "tinfoilcipherstorage-${var.environment_name}"
        Environment = var.environment_name
    }
}

#--Configure S3 Public Access
resource "aws_s3_bucket_public_access_block" "tinfoil" {
    bucket                  = aws_s3_bucket.tinfoil.id
    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = true
}