# Terraform: AWS VPC with 3 public + 3 private subnets and a public EC2

## What this creates
* 1 VPC (10.0.0.0/16)
* 3 public subnets across AZs with an Internet Gateway and public route
* 3 private subnets with no direct Internet egress
* 1 EC2 instance in a public subnet with port 80 open from the Internet

## Prerequisites: AWS IAM permissions for Terraform.
* For this project to run successfully, need a AWS user with the correct permissions.
* Need a IAM user and role with a custom policy that grants only the permissions.
* Configure your AWS Credentials and enter the Access Key ID and Secret Access key of the user you created.
* Project is configured to use AWS Systems Manager for access to EC2,Required a IAM role along with port 443.

## Usage
```bash
terraform init
terraform plan -var-file=env.tfvars
terraform apply -var-file=env.tfvars
