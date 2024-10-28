# terragrunt-dependencies-and-terraform-checks
Here we are defining how to add Dependencies between modules in Terragrunt and create various Terraform checks

The dependency graph could be checked with following command


 terragrunt_code git:(main) ✗ terragrunt  graph-dependencies 
>```
>digraph {
>        "/Users/sandeepbelagavi/repos/terragrunt-dependencies-and-terraform-checks/terragrunt_code" ;
>        "ec2" ;
>        "ec2" -> "security_group";
>        "ec2" -> "iam_instance_profile";
>        "iam" ;
>        "iam_instance_profile" ;
>        "iam_instance_profile" -> "iam";
>        "security_group" ;
>}
>```

Example of how run-all plan would look like with dependency

```
terragrunt_code git:(main) ✗ terragrunt run-all plan 
11:59:02.440 INFO   The stack at . will be processed in the following order for command plan:
Group 1
- Module .
- Module ./iam
- Module ./security_group

Group 2
- Module ./iam_instance_profile

Group 3
- Module ./ec2


11:59:02.666 INFO   [iam] Downloading Terraform configurations from ../modules into ./iam/.terragrunt-cache/JOG7DPJzT8lCn4oaK2NBBmKIzsY/ijovuow4tvfsnZ8vZXeend53e3o
11:59:02.667 INFO   [security_group] Downloading Terraform configurations from ../modules into ./security_group/.terragrunt-cache/WrIuCPUlyAo8crmtuA2cSwi4Slw/ijovuow4tvfsnZ8vZXeend53e3o
11:59:02.719 STDOUT [security_group] terraform: Initializing the backend...
11:59:02.725 STDOUT [iam] terraform: Initializing the backend...
11:59:05.279 STDOUT [iam] terraform: 
11:59:05.279 STDOUT [iam] terraform: Successfully configured the backend "s3"! Terraform will automatically
11:59:05.279 STDOUT [iam] terraform: use this backend unless the backend configuration changes.
11:59:05.333 STDOUT [security_group] terraform: 
11:59:05.333 STDOUT [security_group] terraform: Successfully configured the backend "s3"! Terraform will automatically
11:59:05.333 STDOUT [security_group] terraform: use this backend unless the backend configuration changes.
11:59:05.817 STDOUT [iam] terraform: Initializing provider plugins...
11:59:05.817 STDOUT [iam] terraform: - Finding hashicorp/aws versions matching "~> 4.0"...
11:59:05.866 STDOUT [security_group] terraform: Initializing provider plugins...
11:59:05.866 STDOUT [security_group] terraform: - Finding hashicorp/aws versions matching "~> 4.0"...
11:59:06.225 STDOUT [security_group] terraform: - Installing hashicorp/aws v4.67.0...
11:59:06.252 STDOUT [iam] terraform: - Installing hashicorp/aws v4.67.0...
11:59:06.408 STDOUT terraform: No changes. Your infrastructure matches the configuration.
11:59:06.408 STDOUT terraform: Terraform has compared your real infrastructure against your configuration
11:59:06.408 STDOUT terraform: and found no differences, so no changes are needed.
11:59:11.147 STDOUT [security_group] terraform: - Installed hashicorp/aws v4.67.0 (signed by HashiCorp)
11:59:11.148 STDOUT [security_group] terraform: Terraform has created a lock file .terraform.lock.hcl to record the provider
11:59:11.148 STDOUT [security_group] terraform: selections it made above. Include this file in your version control repository
11:59:11.148 STDOUT [security_group] terraform: so that Terraform can guarantee to make the same selections by default when
11:59:11.148 STDOUT [security_group] terraform: you run "terraform init" in the future.
11:59:11.149 STDOUT [security_group] terraform: Terraform has been successfully initialized!
11:59:11.149 STDOUT [security_group] terraform: 
11:59:11.149 STDOUT [security_group] terraform: You may now begin working with Terraform. Try running "terraform plan" to see
11:59:11.149 STDOUT [security_group] terraform: any changes that are required for your infrastructure. All Terraform commands
11:59:11.149 STDOUT [security_group] terraform: should now work.
11:59:11.149 STDOUT [security_group] terraform: If you ever set or change modules or backend configuration for Terraform,
11:59:11.149 STDOUT [security_group] terraform: rerun this command to reinitialize your working directory. If you forget, other
11:59:11.149 STDOUT [security_group] terraform: commands will detect it and remind you to do so if necessary.
11:59:12.458 STDOUT [iam] terraform: - Installed hashicorp/aws v4.67.0 (signed by HashiCorp)
11:59:12.458 STDOUT [iam] terraform: Terraform has created a lock file .terraform.lock.hcl to record the provider
11:59:12.458 STDOUT [iam] terraform: selections it made above. Include this file in your version control repository
11:59:12.458 STDOUT [iam] terraform: so that Terraform can guarantee to make the same selections by default when
11:59:12.458 STDOUT [iam] terraform: you run "terraform init" in the future.
11:59:12.458 STDOUT [iam] terraform: Terraform has been successfully initialized!
11:59:12.458 STDOUT [iam] terraform: 
11:59:12.458 STDOUT [iam] terraform: You may now begin working with Terraform. Try running "terraform plan" to see
11:59:12.458 STDOUT [iam] terraform: any changes that are required for your infrastructure. All Terraform commands
11:59:12.458 STDOUT [iam] terraform: should now work.
11:59:12.458 STDOUT [iam] terraform: If you ever set or change modules or backend configuration for Terraform,
11:59:12.458 STDOUT [iam] terraform: rerun this command to reinitialize your working directory. If you forget, other
11:59:12.458 STDOUT [iam] terraform: commands will detect it and remind you to do so if necessary.
11:59:19.920 STDOUT [security_group] terraform: Terraform used the selected providers to generate the following execution
11:59:19.921 STDOUT [security_group] terraform: plan. Resource actions are indicated with the following symbols:
11:59:19.921 STDOUT [security_group] terraform:   + create
11:59:19.921 STDOUT [security_group] terraform: Terraform will perform the following actions:
11:59:19.921 STDOUT [security_group] terraform:   # aws_security_group.allow_sg will be created
11:59:19.921 STDOUT [security_group] terraform:   + resource "aws_security_group" "allow_sg" {
11:59:19.921 STDOUT [security_group] terraform:       + arn                    = (known after apply)
11:59:19.921 STDOUT [security_group] terraform:       + description            = "Allow tls inbound traffic"
11:59:19.921 STDOUT [security_group] terraform:       + egress                 = [
11:59:19.921 STDOUT [security_group] terraform:           + {
11:59:19.921 STDOUT [security_group] terraform:               + cidr_blocks      = [
11:59:19.921 STDOUT [security_group] terraform:                   + "0.0.0.0/0",
11:59:19.921 STDOUT [security_group] terraform:                 ]
11:59:19.921 STDOUT [security_group] terraform:               + description      = "TLS from VPC"
11:59:19.921 STDOUT [security_group] terraform:               + from_port        = 0
11:59:19.921 STDOUT [security_group] terraform:               + ipv6_cidr_blocks = [
11:59:19.921 STDOUT [security_group] terraform:                   + "::/0",
11:59:19.921 STDOUT [security_group] terraform:                 ]
11:59:19.921 STDOUT [security_group] terraform:               + prefix_list_ids  = []
11:59:19.921 STDOUT [security_group] terraform:               + protocol         = "-1"
11:59:19.921 STDOUT [security_group] terraform:               + security_groups  = []
11:59:19.921 STDOUT [security_group] terraform:               + self             = false
11:59:19.921 STDOUT [security_group] terraform:               + to_port          = 0
11:59:19.921 STDOUT [security_group] terraform:             },
11:59:19.921 STDOUT [security_group] terraform:         ]
11:59:19.921 STDOUT [security_group] terraform:       + id                     = (known after apply)
11:59:19.921 STDOUT [security_group] terraform:       + ingress                = [
11:59:19.921 STDOUT [security_group] terraform:           + {
11:59:19.921 STDOUT [security_group] terraform:               + cidr_blocks      = [
11:59:19.921 STDOUT [security_group] terraform:                   + "24.239.131.31/32",
11:59:19.921 STDOUT [security_group] terraform:                   + "24.239.131.30/32",
11:59:19.921 STDOUT [security_group] terraform:                 ]
11:59:19.921 STDOUT [security_group] terraform:               + description      = "SSH from VPC"
11:59:19.921 STDOUT [security_group] terraform:               + from_port        = 22
11:59:19.921 STDOUT [security_group] terraform:               + ipv6_cidr_blocks = []
11:59:19.921 STDOUT [security_group] terraform:               + prefix_list_ids  = []
11:59:19.921 STDOUT [security_group] terraform:               + protocol         = "tcp"
11:59:19.921 STDOUT [security_group] terraform:               + security_groups  = []
11:59:19.921 STDOUT [security_group] terraform:               + self             = false
11:59:19.921 STDOUT [security_group] terraform:               + to_port          = 22
11:59:19.922 STDOUT [security_group] terraform:             },
11:59:19.922 STDOUT [security_group] terraform:         ]
11:59:19.922 STDOUT [security_group] terraform:       + name                   = "Demo-SG"
11:59:19.922 STDOUT [security_group] terraform:       + name_prefix            = (known after apply)
11:59:19.922 STDOUT [security_group] terraform:       + owner_id               = (known after apply)
11:59:19.922 STDOUT [security_group] terraform:       + revoke_rules_on_delete = false
11:59:19.922 STDOUT [security_group] terraform:       + tags                   = {
11:59:19.922 STDOUT [security_group] terraform:           + "Name" = "Demo-SG"
11:59:19.922 STDOUT [security_group] terraform:         }
11:59:19.922 STDOUT [security_group] terraform:       + tags_all               = {
11:59:19.922 STDOUT [security_group] terraform:           + "Name" = "Demo-SG"
11:59:19.922 STDOUT [security_group] terraform:         }
11:59:19.922 STDOUT [security_group] terraform:       + vpc_id                 = (known after apply)
11:59:19.922 STDOUT [security_group] terraform:     }
11:59:19.922 STDOUT [security_group] terraform: Plan: 1 to add, 0 to change, 0 to destroy.
11:59:19.922 STDOUT [security_group] terraform: 
11:59:19.922 STDOUT [security_group] terraform: Changes to Outputs:
11:59:19.922 STDOUT [security_group] terraform:   + security_group_id = (known after apply)
11:59:19.922 STDOUT [security_group] terraform: 
11:59:19.922 STDOUT [security_group] terraform: ─────────────────────────────────────────────────────────────────────────────
11:59:19.922 STDOUT [security_group] terraform: Note: You didn't use the -out option to save this plan, so Terraform can't
11:59:19.922 STDOUT [security_group] terraform: guarantee to take exactly these actions if you run "terraform apply" now.
11:59:23.264 STDOUT [iam] terraform: Terraform used the selected providers to generate the following execution
11:59:23.264 STDOUT [iam] terraform: plan. Resource actions are indicated with the following symbols:
11:59:23.264 STDOUT [iam] terraform:   + create
11:59:23.264 STDOUT [iam] terraform: Terraform will perform the following actions:
11:59:23.264 STDOUT [iam] terraform:   # aws_iam_role.test_role will be created
11:59:23.264 STDOUT [iam] terraform:   + resource "aws_iam_role" "test_role" {
11:59:23.264 STDOUT [iam] terraform:       + arn                   = (known after apply)
11:59:23.265 STDOUT [iam] terraform:       + assume_role_policy    = jsonencode(
11:59:23.265 STDOUT [iam] terraform:             {
11:59:23.265 STDOUT [iam] terraform:               + Statement = [
11:59:23.265 STDOUT [iam] terraform:                   + {
11:59:23.265 STDOUT [iam] terraform:                       + Action    = "sts:AssumeRole"
11:59:23.265 STDOUT [iam] terraform:                       + Effect    = "Allow"
11:59:23.265 STDOUT [iam] terraform:                       + Principal = {
11:59:23.265 STDOUT [iam] terraform:                           + Service = "ec2.amazonaws.com"
11:59:23.265 STDOUT [iam] terraform:                         }
11:59:23.265 STDOUT [iam] terraform:                       + Sid       = ""
11:59:23.265 STDOUT [iam] terraform:                     },
11:59:23.265 STDOUT [iam] terraform:                 ]
11:59:23.265 STDOUT [iam] terraform:               + Version   = "2012-10-17"
11:59:23.265 STDOUT [iam] terraform:             }
11:59:23.265 STDOUT [iam] terraform:         )
11:59:23.265 STDOUT [iam] terraform:       + create_date           = (known after apply)
11:59:23.265 STDOUT [iam] terraform:       + force_detach_policies = false
11:59:23.265 STDOUT [iam] terraform:       + id                    = (known after apply)
11:59:23.265 STDOUT [iam] terraform:       + managed_policy_arns   = (known after apply)
11:59:23.265 STDOUT [iam] terraform:       + max_session_duration  = 3600
11:59:23.265 STDOUT [iam] terraform:       + name                  = "Demo-role"
11:59:23.265 STDOUT [iam] terraform:       + name_prefix           = (known after apply)
11:59:23.265 STDOUT [iam] terraform:       + path                  = "/"
11:59:23.265 STDOUT [iam] terraform:       + role_last_used        = (known after apply)
11:59:23.265 STDOUT [iam] terraform:       + tags                  = {
11:59:23.265 STDOUT [iam] terraform:           + "name" = "Demo-role"
11:59:23.265 STDOUT [iam] terraform:         }
11:59:23.265 STDOUT [iam] terraform:       + tags_all              = {
11:59:23.265 STDOUT [iam] terraform:           + "name" = "Demo-role"
11:59:23.265 STDOUT [iam] terraform:         }
11:59:23.265 STDOUT [iam] terraform:       + unique_id             = (known after apply)
11:59:23.265 STDOUT [iam] terraform:       + inline_policy (known after apply)
11:59:23.265 STDOUT [iam] terraform:     }
11:59:23.265 STDOUT [iam] terraform: Plan: 1 to add, 0 to change, 0 to destroy.
11:59:23.265 STDOUT [iam] terraform: 
11:59:23.265 STDOUT [iam] terraform: Changes to Outputs:
11:59:23.265 STDOUT [iam] terraform:   + iam_role_name = "Demo-role"
11:59:23.265 STDOUT [iam] terraform: 
11:59:23.265 STDOUT [iam] terraform: ─────────────────────────────────────────────────────────────────────────────
11:59:23.266 STDOUT [iam] terraform: Note: You didn't use the -out option to save this plan, so Terraform can't
11:59:23.266 STDOUT [iam] terraform: guarantee to take exactly these actions if you run "terraform apply" now.
11:59:26.358 WARN   [iam_instance_profile] Config ./iam/terragrunt.hcl is a dependency of ./iam_instance_profile/terragrunt.hcl that has no outputs, but mock outputs provided and returning those in dependency output.
11:59:26.367 INFO   [iam_instance_profile] Downloading Terraform configurations from ../modules into ./iam_instance_profile/.terragrunt-cache/3oEVDwVI3X5YJ9Hp5le9aY6Z65U/ijovuow4tvfsnZ8vZXeend53e3o
11:59:26.412 STDOUT [iam_instance_profile] terraform: Initializing the backend...
11:59:28.898 STDOUT [iam_instance_profile] terraform: 
11:59:28.898 STDOUT [iam_instance_profile] terraform: Successfully configured the backend "s3"! Terraform will automatically
11:59:28.898 STDOUT [iam_instance_profile] terraform: use this backend unless the backend configuration changes.
11:59:29.540 STDOUT [iam_instance_profile] terraform: Initializing provider plugins...
11:59:29.540 STDOUT [iam_instance_profile] terraform: - Finding hashicorp/aws versions matching "~> 4.0"...
11:59:29.824 STDOUT [iam_instance_profile] terraform: - Installing hashicorp/aws v4.67.0...
11:59:33.100 STDOUT [iam_instance_profile] terraform: - Installed hashicorp/aws v4.67.0 (signed by HashiCorp)
11:59:33.101 STDOUT [iam_instance_profile] terraform: Terraform has created a lock file .terraform.lock.hcl to record the provider
11:59:33.101 STDOUT [iam_instance_profile] terraform: selections it made above. Include this file in your version control repository
11:59:33.101 STDOUT [iam_instance_profile] terraform: so that Terraform can guarantee to make the same selections by default when
11:59:33.101 STDOUT [iam_instance_profile] terraform: you run "terraform init" in the future.
11:59:33.101 STDOUT [iam_instance_profile] terraform: Terraform has been successfully initialized!
11:59:33.101 STDOUT [iam_instance_profile] terraform: 
11:59:33.101 STDOUT [iam_instance_profile] terraform: You may now begin working with Terraform. Try running "terraform plan" to see
11:59:33.101 STDOUT [iam_instance_profile] terraform: any changes that are required for your infrastructure. All Terraform commands
11:59:33.102 STDOUT [iam_instance_profile] terraform: should now work.
11:59:33.102 STDOUT [iam_instance_profile] terraform: If you ever set or change modules or backend configuration for Terraform,
11:59:33.102 STDOUT [iam_instance_profile] terraform: rerun this command to reinitialize your working directory. If you forget, other
11:59:33.102 STDOUT [iam_instance_profile] terraform: commands will detect it and remind you to do so if necessary.
11:59:42.420 STDOUT [iam_instance_profile] terraform: Terraform used the selected providers to generate the following execution
11:59:42.420 STDOUT [iam_instance_profile] terraform: plan. Resource actions are indicated with the following symbols:
11:59:42.420 STDOUT [iam_instance_profile] terraform:   + create
11:59:42.420 STDOUT [iam_instance_profile] terraform: Terraform will perform the following actions:
11:59:42.420 STDOUT [iam_instance_profile] terraform:   # aws_iam_instance_profile.test_profile will be created
11:59:42.421 STDOUT [iam_instance_profile] terraform:   + resource "aws_iam_instance_profile" "test_profile" {
11:59:42.421 STDOUT [iam_instance_profile] terraform:       + arn         = (known after apply)
11:59:42.421 STDOUT [iam_instance_profile] terraform:       + create_date = (known after apply)
11:59:42.421 STDOUT [iam_instance_profile] terraform:       + id          = (known after apply)
11:59:42.421 STDOUT [iam_instance_profile] terraform:       + name        = "Demo-profile"
11:59:42.421 STDOUT [iam_instance_profile] terraform:       + name_prefix = (known after apply)
11:59:42.421 STDOUT [iam_instance_profile] terraform:       + path        = "/"
11:59:42.421 STDOUT [iam_instance_profile] terraform:       + role        = "sample-role-name"
11:59:42.421 STDOUT [iam_instance_profile] terraform:       + tags_all    = (known after apply)
11:59:42.421 STDOUT [iam_instance_profile] terraform:       + unique_id   = (known after apply)
11:59:42.421 STDOUT [iam_instance_profile] terraform:     }
11:59:42.421 STDOUT [iam_instance_profile] terraform: Plan: 1 to add, 0 to change, 0 to destroy.
11:59:42.421 STDOUT [iam_instance_profile] terraform: 
11:59:42.421 STDOUT [iam_instance_profile] terraform: Changes to Outputs:
11:59:42.421 STDOUT [iam_instance_profile] terraform:   + instance_profile_name = "Demo-profile"
11:59:42.421 STDOUT [iam_instance_profile] terraform: 
11:59:42.421 STDOUT [iam_instance_profile] terraform: ─────────────────────────────────────────────────────────────────────────────
11:59:42.421 STDOUT [iam_instance_profile] terraform: Note: You didn't use the -out option to save this plan, so Terraform can't
11:59:42.421 STDOUT [iam_instance_profile] terraform: guarantee to take exactly these actions if you run "terraform apply" now.
11:59:42.473 WARN   [iam_instance_profile] Config ./iam/terragrunt.hcl is a dependency of ./iam_instance_profile/terragrunt.hcl that has no outputs, but mock outputs provided and returning those in dependency output.
11:59:42.517 WARN   [iam_instance_profile] Config ./iam/terragrunt.hcl is a dependency of ./iam_instance_profile/terragrunt.hcl that has no outputs, but mock outputs provided and returning those in dependency output.
11:59:45.420 WARN   [ec2] Config ./iam_instance_profile/terragrunt.hcl is a dependency of ./ec2/terragrunt.hcl that has no outputs, but mock outputs provided and returning those in dependency output.
11:59:45.481 WARN   [ec2] Config ./security_group/terragrunt.hcl is a dependency of ./ec2/terragrunt.hcl that has no outputs, but mock outputs provided and returning those in dependency output.
11:59:45.486 INFO   [ec2] Downloading Terraform configurations from ../modules into ./ec2/.terragrunt-cache/22JIpF98eD5gO3lpcsBXPGU-NzI/ijovuow4tvfsnZ8vZXeend53e3o
11:59:45.531 STDOUT [ec2] terraform: Initializing the backend...
11:59:47.747 STDOUT [ec2] terraform: 
11:59:47.747 STDOUT [ec2] terraform: Successfully configured the backend "s3"! Terraform will automatically
11:59:47.747 STDOUT [ec2] terraform: use this backend unless the backend configuration changes.
11:59:48.277 STDOUT [ec2] terraform: Initializing provider plugins...
11:59:48.277 STDOUT [ec2] terraform: - Finding hashicorp/aws versions matching "~> 4.0"...
11:59:48.505 STDOUT [ec2] terraform: - Installing hashicorp/aws v4.67.0...
11:59:52.168 STDOUT [ec2] terraform: - Installed hashicorp/aws v4.67.0 (signed by HashiCorp)
11:59:52.168 STDOUT [ec2] terraform: Terraform has created a lock file .terraform.lock.hcl to record the provider
11:59:52.168 STDOUT [ec2] terraform: selections it made above. Include this file in your version control repository
11:59:52.168 STDOUT [ec2] terraform: so that Terraform can guarantee to make the same selections by default when
11:59:52.168 STDOUT [ec2] terraform: you run "terraform init" in the future.
11:59:52.168 STDOUT [ec2] terraform: Terraform has been successfully initialized!
11:59:52.168 STDOUT [ec2] terraform: 
11:59:52.168 STDOUT [ec2] terraform: You may now begin working with Terraform. Try running "terraform plan" to see
11:59:52.168 STDOUT [ec2] terraform: any changes that are required for your infrastructure. All Terraform commands
11:59:52.169 STDOUT [ec2] terraform: should now work.
11:59:52.169 STDOUT [ec2] terraform: If you ever set or change modules or backend configuration for Terraform,
11:59:52.169 STDOUT [ec2] terraform: rerun this command to reinitialize your working directory. If you forget, other
11:59:52.169 STDOUT [ec2] terraform: commands will detect it and remind you to do so if necessary.
12:00:01.446 STDOUT [ec2] terraform: Terraform used the selected providers to generate the following execution
12:00:01.446 STDOUT [ec2] terraform: plan. Resource actions are indicated with the following symbols:
12:00:01.446 STDOUT [ec2] terraform:   + create
12:00:01.446 STDOUT [ec2] terraform: Terraform will perform the following actions:
12:00:01.446 STDOUT [ec2] terraform:   # aws_instance.web will be created
12:00:01.446 STDOUT [ec2] terraform:   + resource "aws_instance" "web" {
12:00:01.446 STDOUT [ec2] terraform:       + ami                                  = "ami-0574da719dca65348"
12:00:01.446 STDOUT [ec2] terraform:       + arn                                  = (known after apply)
12:00:01.446 STDOUT [ec2] terraform:       + associate_public_ip_address          = (known after apply)
12:00:01.446 STDOUT [ec2] terraform:       + availability_zone                    = (known after apply)
12:00:01.446 STDOUT [ec2] terraform:       + cpu_core_count                       = (known after apply)
12:00:01.446 STDOUT [ec2] terraform:       + cpu_threads_per_core                 = (known after apply)
12:00:01.446 STDOUT [ec2] terraform:       + disable_api_stop                     = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + disable_api_termination              = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + ebs_optimized                        = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + get_password_data                    = false
12:00:01.447 STDOUT [ec2] terraform:       + host_id                              = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + host_resource_group_arn              = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + iam_instance_profile                 = "sample-instance-profile-name"
12:00:01.447 STDOUT [ec2] terraform:       + id                                   = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + instance_initiated_shutdown_behavior = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + instance_state                       = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + instance_type                        = "t2.large"
12:00:01.447 STDOUT [ec2] terraform:       + ipv6_address_count                   = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + ipv6_addresses                       = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + key_name                             = "testkeypair"
12:00:01.447 STDOUT [ec2] terraform:       + monitoring                           = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + outpost_arn                          = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + password_data                        = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + placement_group                      = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + placement_partition_number           = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + primary_network_interface_id         = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + private_dns                          = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + private_ip                           = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + public_dns                           = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + public_ip                            = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + secondary_private_ips                = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + security_groups                      = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + source_dest_check                    = true
12:00:01.447 STDOUT [ec2] terraform:       + subnet_id                            = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + tags_all                             = (known after apply)
12:00:01.447 STDOUT [ec2] terraform:       + tenancy                              = (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + user_data                            = (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + user_data_base64                     = (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + user_data_replace_on_change          = false
12:00:01.448 STDOUT [ec2] terraform:       + vpc_security_group_ids               = [
12:00:01.448 STDOUT [ec2] terraform:           + "sample-sg",
12:00:01.448 STDOUT [ec2] terraform:         ]
12:00:01.448 STDOUT [ec2] terraform:       + capacity_reservation_specification (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + cpu_options (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + ebs_block_device (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + enclave_options (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + ephemeral_block_device (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + maintenance_options (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + metadata_options (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + network_interface (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + private_dns_name_options (known after apply)
12:00:01.448 STDOUT [ec2] terraform:       + root_block_device (known after apply)
12:00:01.448 STDOUT [ec2] terraform:     }
12:00:01.448 STDOUT [ec2] terraform: Plan: 1 to add, 0 to change, 0 to destroy.
12:00:01.448 STDOUT [ec2] terraform: 
12:00:01.448 STDOUT [ec2] terraform: ─────────────────────────────────────────────────────────────────────────────
12:00:01.448 STDOUT [ec2] terraform: Note: You didn't use the -out option to save this plan, so Terraform can't
12:00:01.448 STDOUT [ec2] terraform: guarantee to take exactly these actions if you run "terraform apply" now.
`
