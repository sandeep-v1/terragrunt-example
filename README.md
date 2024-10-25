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

## **Workflow and optimization** - 

We will go over different structure of terraform and look at extensibility. 

1. infra-live-1 : basic mode (live - is convention to say that env is up with with this code).
2. infra-using-modules : Modularising the code for re-usability 
3. infra-using-terragrunt (local state)
4. infra-using-terragrunt (remote state/prod grade)

### **infra-live-1** :

> The code here is written for dev environment, if we are to extend to other environments like staging/prod,
> We should write same code like dev (folder structure).

### **infra-using-modules** :

> Modules to the rescue!!, In this case we write a common module `infra-modules`.
> This module is reused in main.tf of respective environments like dev/staging.

### **infra-using-terragrunt** : 

> Commands to run `terragrunt init, terragrunt apply, terragrunt destroy` similar to terraform.
> Terragrunt simplifies backend configuration management by allowing users to define configurations once in a root location and inherit them in all child modules. The speaker also discusses the challenge of managing provider configurations across multiple modules and how Terragrunt can help refactor common Terraform code to keep modules DRY. 

 
**References:**
* (blog by terragrunt developers) https://blog.gruntwork.io/how-to-manage-multiple-environments-with-terraform-using-terragrunt-2c3e32fc60a8
* (remote state for multiple accounts) https://terragrunt.gruntwork.io/docs/features/keep-your-remote-state-configuration-dry/

Code structure

```├── infra-live-v1
│   └── dev
│       └── vpc
│           ├── 0-provider.tf
│           ├── 1-vpc.tf
│           ├── 2-igw.tf
│           ├── 3-subnets.tf
│           ├── 4-nat.tf
│           ├── 5-routes.tf
│           └── 6-outputs.tf
├── infra-modules
│   └── vpc
│       ├── 0-versions.tf
│       ├── 1-vpc.tf
│       ├── 2-subnets.tf
│       ├── 3-igw.tf
│       ├── 4-nat.tf
│       ├── 5-routes.tf
│       ├── 6-outputs.tf
│       └── 7-veriables.tf
├── infra-using-modules
│   ├── dev
│   │   └── vpc
│   │       ├── main.tf
│   │       └── output.tf
│   └── staging
│       └── vpc
│           ├── main.tf
│           └── output.tf
├── infra-using-terragrunt
│   ├── backend.tf
│   ├── dev
│   │   └── vpc
│   │       └── terragrunt.hcl
│   ├── provider.tf
│   ├── staging
│   │   └── vpc
│   │       └── terragrunt.hcl
│   └── terragrunt.hcl```
