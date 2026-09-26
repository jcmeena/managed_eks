data "aws_availability_zones" "available" {}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-pro-vpc"
  cidr = "10.0.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true # Required so private worker nodes can pull container images
  single_nat_gateway = true # Saves architectural costs for testing

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1" # Instructs Kubernetes to place public load balancers here
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1" # For internal database/service load balancers
  }
}



