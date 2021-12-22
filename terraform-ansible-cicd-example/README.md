# terraform-ansible-cidc-example

Example code to create an AWS environment and build a LEMP stack via Bitbucket CI/CD pipline in Bitbucket using Terraform and Ansible. Leverages Vault for Secret Management and an S3 Remate Backend for central State management.

This example will also require a funcional instance of Vault with working secrets (or a small rewrite passing variables from within the repository variables).

Pipeline leverages Hashicorp's official Terraform Docker Image and Python's official 2.7.13 Image for use in build process.

Files intended for use in conjuction with the blog post **BitBucket, Terraform and Ansible – Extending Infrastructure CI/CD In To Configuration Management** https://www.tinfoilcipher.co.uk/2020/05/13/bitbucket-terraform-and-ansible-extending-infrastructure-ci-cd-in-to-configuration-management/
