
# Notes:
# Terraform does not allow variables (var.*) in the backend block directly. This is a Terraform limitation — the backend config must be static at terraform init time.

# Command
# terraform init -backend-config=backend-dev.config

# Misc:
# ${terraform.workspace}: Automatically segregates state files for dev, test, prod
# key = "group-1/eks/${terraform.workspace}/aws-eks-devops-capstone.tfstate"

# Enables state locking and prevents race conditions
# dynamodb_table = "terraform-locks"


terraform {
  backend "s3" {}
}