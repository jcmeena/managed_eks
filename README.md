
Deploying an Amazon EKS (Elastic Kubernetes Service) cluster moves you directly into enterprise-grade cloud architecture. This is one of the most heavily tested domains on the AWS Certified DevOps Engineer - Professional and AWS Certified Solutions Architect - Professional exams.

EKS can be complex because Kubernetes requires a highly specific underlying network architecture and extensive IAM permission mapping before a cluster can boot.


Project 8: Production-Ready Amazon EKS Cluster

To keep this project highly organized, safe, and maintainable, we will use the industry-standard, verified AWS-built Terraform Registry Modules instead of writing thousands of lines of low-level boilerplate code.

Step 1: Set Up a Dedicated Folder
Open your terminal and run:
mkdir managed-eks
cd managed-eks


# 1. Gather Availability Zones dynamically

# 2. Deploy Enterprise VPC via Official AWS Module
# Kubernetes clusters require specific tagging to route load balancer traffic properly

# 3. Deploy Managed EKS Cluster via Official AWS Module

# 4. Configure Managed Node Groups (EC2 Worker Instances)


Error
Version error
│ Error: Failed to query available provider packages
│
│ Could not retrieve the list of available versions for provider hashicorp/aws: locked provider registry.terraform.io/hashicorp/aws
│ 6.60.0 does not match configured version constraint >= 4.33.0, >= 5.79.0, >= 5.95.0, < 6.0.0, ~> 6.60.0; must use terraform init
│ -upgrade to allow selection of new versions
│
│ To see which modules are currently depending on hashicorp/aws and what versions are specified, run the following command:
│     terraform providers

updated terrform.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, < 7.0.0"
    }

  }
}
ran following commands

rm -f .terraform.lock.hcl
rm -rf .terraform/
then ran 
terraform init -upgrade
