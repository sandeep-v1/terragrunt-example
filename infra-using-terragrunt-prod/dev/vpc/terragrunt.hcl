terraform {
    #   source = "git@<repo>//vpc?ref=vpc-v0.0.1"
  source = "git@github.com:terraform-aws-modules/terraform-aws-vpc.git"

  extra_arguments "custom" {
    commands = [
        "plan",
        "apply"
    ]
    required_var_files = ["./terraform.tfvars"]
  }
  
}

include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path           = find_in_parent_folders("env.hcl")
  expose         = true
  merge_strategy = "no_merge"
}

inputs = {
  env             = include.env.locals.env
#   azs             = ["us-east-1a", "us-east-1b"]
#   private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
#   public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]

  private_subnet_tags = {
    "${include.env.locals.env}-internal-elb" = 1
    "${include.env.locals.env}-dev-demo"  = "owned"
  }

  public_subnet_tags = {
    "${include.env.locals.env}-elb"         = 1
    "${include.env.locals.env}-dev-demo" = "owned"
  }
}
