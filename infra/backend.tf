
# Terraform does not allow variables (var.*) in the backend block directly.
# This is a Terraform limitation — the backend config must be static at terraform init time.

# terraform init -backend-config=backend-dev.config

terraform {
  backend "s3" {}
}