# Terraform code for prod EKS cluster

module "eks_cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "prod-eks-cluster"
  cluster_version = "1.29"
  subnet_ids      = ["subnet-abc123", "subnet-def456"]
  vpc_id          = "vpc-xxxxxx"

  eks_managed_node_groups = {
    dev-workers = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.medium"]
    }
  }
}
