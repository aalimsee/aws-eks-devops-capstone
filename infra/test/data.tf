
locals {
  projectName = "aws-eks-devops-capstone"
}

//data "aws_vpcs" "all_vpcs" {}

#======================================
# Fetch the VPC ID by name
data "aws_vpcs" "filtered_vpcs" {
  filter {
    name   = "tag:Name"
    values = ["*${local.projectName}*"]
  }
}

# Fetch subnets for the filtered VPC
#===================================
data "aws_subnets" "filtered_subnets" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.filtered_vpcs.ids
  }
}

# Fetch public subnets for the filtered VPC
#==========================================
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.filtered_vpcs.ids
  }
  tags = {
    Name = "*${local.projectName}*public*"
  }
}

# Fetch private subnets for the filtered VPC
#===========================================
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.filtered_vpcs.ids
  }
  tags = {
    Name = "*${local.projectName}*private*"
  }
}

//output "vpcs" {value = data.aws_vpcs.filtered_vpcs.ids}

//output "subnet_ids" {value = data.aws_subnets.filtered_subnets.ids}

//output "public_subnet_ids" {value = data.aws_subnets.public.ids}
# Fetch one public subnets
# output "public_subnet_id1" {value = data.aws_subnets.public.ids[0]}
# output "public_subnet_id2" {value = data.aws_subnets.public.ids[1]}
# output "public_subnet_id3" {value = data.aws_subnets.public.ids[2]}

//output "private_subnet_ids" {value = data.aws_subnets.private.ids}
# Fetch one public subnets
# output "private_subnet_id1" {value = data.aws_subnets.private.ids[0]}
# output "private_subnet_id2" {value = data.aws_subnets.private.ids[1]}
# output "private_subnet_id3" {value = data.aws_subnets.private.ids[2]}
