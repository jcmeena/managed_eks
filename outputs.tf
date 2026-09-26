# Outputs needed to connect your machine to Kubernetes
output "cluster_endpoint" {
  description = "The endpoint for your Kubernetes API server"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "The name of your EKS cluster"
  value       = module.eks.cluster_name
}

output "kubeconfig_update_command" {
  description = "Run this terminal command to link your local machine to the cluster"
  value       = "aws eks update-kubeconfig --region us-east-1 --name ${module.eks.cluster_name}"
}