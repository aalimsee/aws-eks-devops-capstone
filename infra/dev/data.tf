


//data "aws_vpcs" "all_vpcs" {}

#======================================
# Fetch the VPC ID by name
data "aws_vpcs" "filtered_vpcs" {
  filter {
    name   = "tag:Name"
    values = ["*aws-eks-devops-capstone*"]
  }
}
//output "vpcs" {value = data.aws_vpcs.filtered_vpcs.ids}

# Fetch subnets for the filtered VPC
#===================================
data "aws_subnets" "filtered_subnets" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.filtered_vpcs.ids
  }
}
//output "subnet_ids" {value = data.aws_subnets.filtered_subnets.ids}

# Fetch public subnets for the filtered VPC
#==========================================
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.filtered_vpcs.ids
  }
  tags = {
    Name = "*aws-eks-devops-capstone*public*"
  }
}
//output "public_subnet_ids" {value = data.aws_subnets.public.ids}
# Fetch one public subnets
# output "public_subnet_id1" {value = data.aws_subnets.public.ids[0]}
# output "public_subnet_id2" {value = data.aws_subnets.public.ids[1]}
# output "public_subnet_id3" {value = data.aws_subnets.public.ids[2]}

# Fetch private subnets for the filtered VPC
#===========================================
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.filtered_vpcs.ids
  }
  tags = {
    Name = "*aws-eks-devops-capstone*private*"
  }
}
//output "private_subnet_ids" {value = data.aws_subnets.private.ids}
# Fetch one public subnets
# output "private_subnet_id1" {value = data.aws_subnets.private.ids[0]}
# output "private_subnet_id2" {value = data.aws_subnets.private.ids[1]}
# output "private_subnet_id3" {value = data.aws_subnets.private.ids[2]}
