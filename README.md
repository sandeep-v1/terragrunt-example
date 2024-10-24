# terragrunt-example (POC)

Terragrunt is an additional wrapper that is built on top of the Terraform. Terraform is a great Infrastructure as Code tool for managing your cloud infrastructure. But as the project size grows and you have multiple environments (Development, Testing, Staging, Production, etc..) to manage then you will realize Terraform has a lot of gaps for managing a complex and large project.

It is open source tool with 8k stars and active development and releases.
> https://github.com/gruntwork-io/terragrunt
> 
> https://terragrunt.gruntwork.io/

**Challenges with Terraform** - 
If you are managing multiple environments (Development, Testing, Staging, and Production in multiple AWS accountsetc..) infrastructure with Terraform then here are the challenges you might face with Terraform -

* __Redundancy of code__ - Multiple copies of the same code for each environment.
* __Manual update of code__ - If there are the same variables that are being used for all the environments then you have to remember and manually update each variable.

Terragrunt by gruntwork was built to improve the shortcomings around the Terraform for effectively managing the infrastructure code so that developers can use the same code without any kind of duplication by keeping the terraform code dry. Terragrunt not only helps you with managing your terraform workspaces effectively but it can also help you with multiple terraform modules, managing Terraform remote state, etc.

**References:**
* (blog by terragrunt developers) https://blog.gruntwork.io/how-to-manage-multiple-environments-with-terraform-using-terragrunt-2c3e32fc60a8
* (remote state for multiple accounts) https://terragrunt.gruntwork.io/docs/features/keep-your-remote-state-configuration-dry/
