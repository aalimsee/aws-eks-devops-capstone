


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
  source  = "terraform-aws-modules/eks/aws"
  version = "20.0.0" # Make sure to pin this or latest stable

  cluster_name    = "dev-eks-cluster"
  cluster_version = "1.30"

  vpc_id     = data.aws_vpcs.filtered_vpcs.ids[0]
  subnet_ids = data.aws_subnets.public.ids

  enable_irsa = true # Enables IAM Roles for Service Accounts
  //manage_aws_auth                = true # Make the module handle aws-auth ConfigMap
  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    dev-workers = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.medium"]

      # Optional, but highly recommended
      iam_role_additional_policies = {
        AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
      }
    }
  }
}