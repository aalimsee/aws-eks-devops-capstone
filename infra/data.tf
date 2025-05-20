


//data "aws_vpcs" "all_vpcs" {}

#======================================
# Fetch the VPC ID by name
data "aws_vpcs" "filtered_vpcs" {
  filter {
    name   = "tag:Name"
    values = ["*${var.grpName}*"]
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
    Name = "*${var.grpName}*public*"
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
    Name = "*${var.grpName}*private*"
  }
}
