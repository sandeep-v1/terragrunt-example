/* module could be relative path, remote git path or public terraform repository */
terraform {
  source = "../../../infra-modules/vpc"
}

/* this would generate backend and provider configuration for us */
include "root" {
  path = find_in_parent_folders()
}

/* this is quite similar to modules structure but in inputs block */
inputs = {
  env             = "dev"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/dev-demo"  = "owned"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb"         = 1
    "kubernetes.io/cluster/dev-demo" = "owned"
  }
}
