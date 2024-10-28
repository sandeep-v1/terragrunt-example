

Terragrunt when using with remote state managment on s3, induces versiong, encryption on initializaton. 

One more aspect to look at is concurrent runs of terraform. Locking 
https://terragrunt.gruntwork.io/docs/getting-started/quick-start/#keep-your-backend-configuration-dry


```
➜  infra-using-terragrunt-prod git:(main) ✗ terragrunt init                          
21:08:25.906 WARN   Versioning is not enabled for the remote state S3 bucket alpha-terraform-state-test. We recommend enabling versioning so that you can roll back to previous versions of your Terraform state in case of error.
21:08:26.917 WARN   The remote state S3 bucket alpha-terraform-state-test needs to be updated:
21:08:26.918 WARN     - Bucket Versioning
21:08:26.918 WARN     - Bucket Server-Side Encryption
21:08:26.918 WARN     - Bucket Root Access
21:08:26.918 WARN     - Bucket Enforced TLS
Remote state S3 bucket alpha-terraform-state-test is out of date. Would you like Terragrunt to update it? (y/n) y
21:08:35.864 WARN   Encryption is not enabled on the S3 remote state bucket alpha-terraform-state-test. Terraform state files may contain secrets, so we STRONGLY recommend enabling encryption!
21:08:35.864 INFO   Enabling Server-Side Encryption for the remote state AWS S3 bucket alpha-terraform-state-test.
21:08:37.424 INFO   Successfully enabled Server-Side Encryption for the remote state AWS S3 bucket alpha-terraform-state-test.
```
