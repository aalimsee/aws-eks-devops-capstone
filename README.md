# CE9 CapStone Project

# aws-eks-devops-capstone

# Setup

## Create Environment (dev)
gh api --method PUT -H "Accept: application/vnd.github+json" /repos/aalimsee/aws-eks-devops-capstone/environments/dev

## Create Actions Secrets
gh secret set AWS_ACCESS_KEY_ID -b"xxx" -r aalimsee/aws-eks-devops-capstone --env dev
gh secret set AWS_SECRET_ACCESS_KEY -b"xxx" -r aalimsee/aws-eks-devops-capstone --env dev

## Create a private Amazon ECR repository

aws ecr create-repository \
  --repository-name product-service \
  --image-scanning-configuration scanOnPush=true \
  --region us-east-1 \
  --tags Key=ProjectName,Value=aws-eks-devops-capstone