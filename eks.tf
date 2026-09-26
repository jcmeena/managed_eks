
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "pro-learning-cluster"
  cluster_version = "1.31" # Up-to-date stable Kubernetes version

  # Gives admin permissions to the AWS IAM entity executing this Terraform script
  enable_cluster_creator_admin_permissions = true

  cluster_endpoint_public_access = true # Allows you to interact with kubectl from your machine

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets # Places worker nodes securely out of public sight

  # 4. Configure Managed Node Groups (EC2 Worker Instances)
  eks_managed_node_groups = {
    general_workers = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t3.medium"] # Minimum recommended size for running Kubernetes components
      capacity_type  = "SPOT"        # ⚠️ CRUCIAL: Uses AWS Spot Instances to slash costs up to 90%!
    }
  }
}
