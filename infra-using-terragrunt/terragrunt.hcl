remote_state {
  backend = "local"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  
 /* path based on env */
 /* terragrunt allows us to define relative path at root level 
  * inheriting it in different env will replace the parameters accordingly 
  * example /dev/vpc or staging/vpc */
  config = {
    path = "${path_relative_to_include()}/terraform.tfstate"
  }
}

/* Defining provider for every module be repeatative */
generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "aws" {
    region = "us-east-1"
}
EOF
}
