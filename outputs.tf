output "backend_bucket_name" {
  description = "S3 bucket created for Terraform state."
  value       = module.s3_backend.bucket_name
}

output "backend_lock_table_name" {
  description = "DynamoDB lock table created for Terraform state."
  value       = module.s3_backend.dynamodb_table_name
}

output "vpc_id" {
  description = "Created VPC ID."
  value       = module.vpc.vpc_id
}

output "eks_cluster_name" {
  description = "Created EKS cluster name."
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS API endpoint."
  value       = module.eks.cluster_endpoint
}

output "rds_endpoint" {
  description = "RDS connection endpoint."
  value       = module.rds.endpoint
}

output "ec2_instance_id" {
  description = "EC2 instance ID."
  value       = module.ec2.instance_id
}

output "ec2_key_pair_name" {
  description = "EC2 key pair name created for SSH access."
  value       = aws_key_pair.ec2.key_name
}

output "ec2_public_ip" {
  description = "EC2 public IP address."
  value       = module.ec2.public_ip
}
