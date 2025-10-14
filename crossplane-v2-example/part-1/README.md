# crossplane-v2-example-part-1

Example code to deploy Crossplane V2 configurations, AWS integrations and AWS resources.

To run you will first need a running kubernetes cluster (ideally EKS) and an IRSA role that allows the deployment of S3 buckets.

Realistically you could follow this article using a local cluster without IRSA, though this will make things a lot harder and you will need to handle authentication through some other method.

If you have access to an AWS environment and don't know quite how to get started standing up a Kubernetes cluster and an IRSA integration, I have provided a [terraform module](https://registry.terraform.io/modules/tinfoilcipher/eks-development-cluster/aws/latest) to get started, be aware that this is **NOT FOR PRODUCTION USE**!!!

Files intended for use in conjuction with the blog post [Crossplane v2 – Infrastructure as Code for Kubernetes Platform Teams Part 1](https://tinfoilcipher.co.uk/2025/10/08/crossplane-v2-iac-for-k8s-platform-teams-part-1).
