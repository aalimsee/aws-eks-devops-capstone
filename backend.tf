


terraform {
  backend "s3" {
    bucket  = "sctp-ce9-tfstate"
    key     = "eks/var.env/var.projectName.tfstate"
    region  = var.region
    encrypt = true
  }
}