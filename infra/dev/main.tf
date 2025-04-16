


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "sctp-ce9-tfstate"
    key     = "eks/dev/aws-eks-devops-capstone.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

# Terraform code for dev EKS cluster

module "eks_cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "dev-eks-cluster"
  cluster_version = "1.29"
  subnet_ids      = data.aws_subnets.filtered_subnets.ids
  vpc_id          = data.aws_vpcs.filtered_vpcs.ids[0]

  eks_managed_node_groups = {
    dev-workers = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t2.micro"]
    }
  }
}
