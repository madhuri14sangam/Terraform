<<<<<<< HEAD
# Terraform: AWS VPC with 3 public + 3 private subnets and a public EC2

## What this creates
# 1 VPC (10.0.0.0/16)
# 3 public subnets across AZs with an Internet Gateway and public route
# 3 private subnets with no direct Internet egress
# 1 EC2 instance in a public subnet with port 80 open from the Internet

## Usage

# terraform init
# terraform plan -var-file=env.tfvars
# terraform apply -var-file=env.tfvars
=======
**Terraform: AWS VPC with 3 public + 3 private subnets and a public EC2**

**What this creates**

1 VPC (10.0.0.0/16)
3 public subnets across AZs with an Internet Gateway and public route
3 private subnets with no direct Internet egress
1 EC2 instance in a public subnet with port 80 open from the Internet

**Usage**
terraform init
terraform plan -var-file=env.tfvars
terraform apply -var-file=env.tfvars
>>>>>>> refs/remotes/origin/main

