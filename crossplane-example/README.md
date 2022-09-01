# crossplane-example

Example code to deploy Crossplane tooling and AWS Controllers to kubernetes and provision some basic resources.

To run you will first need a running kubernetes cluster, ideally EKS to do a secure integration with AWS. However for development purposes this can be a local system such as [kind](https://kind.sigs.k8s.io/docs/user/quick-start/) or [minikube](https://minikube.sigs.k8s.io/docs/start/).

If using a local environment you will need to do some credential configuration as covered [here](https://crossplane.io/docs/v1.9/cloud-providers/aws/aws-provider.html#optional-setup-aws-provider-manually) when prompted in the article.

Files intended for use in conjuction with the blog post **Crossplane - Infrastructure as Code for Kubernetes Platform Teams** https://www.tinfoilcipher.co.uk/2022/09/01/crossplane-infrastructure-as-code-for-kubernetes-platform-teams/