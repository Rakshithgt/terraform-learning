variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used in resource names."
  type        = string
  default     = "terraform-learning"
}

variable "tags" {
  description = "Tags applied to created resources."
  type        = map(string)
  default = {
    Project     = "terraform-learning"
    Environment = "dev"
  }
}

variable "backend_bucket_name" {
  description = "Globally unique S3 bucket name for Terraform state."
  type        = string
}

variable "backend_dynamodb_table_name" {
  description = "DynamoDB table name for Terraform state locking."
  type        = string
  default     = "terraform-learning-locks"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones used for public and private subnets."
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "eks_cluster_name" {
  description = "EKS cluster name."
  type        = string
  default     = "terraform-learning-eks"
}

variable "eks_node_instance_type" {
  description = "EC2 instance type for EKS managed nodes."
  type        = string
  default     = "t3.medium"
}

variable "eks_desired_capacity" {
  description = "Desired EKS node count."
  type        = number
  default     = 2
}

variable "eks_min_capacity" {
  description = "Minimum EKS node count."
  type        = number
  default     = 1
}

variable "eks_max_capacity" {
  description = "Maximum EKS node count."
  type        = number
  default     = 3
}

variable "rds_engine" {
  description = "RDS database engine."
  type        = string
  default     = "mysql"
}

variable "rds_engine_version" {
  description = "RDS database engine version."
  type        = string
  default     = "8.0"
}

variable "rds_instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "Allocated RDS storage in GB."
  type        = number
  default     = 20
}

variable "rds_db_name" {
  description = "Initial RDS database name."
  type        = string
  default     = "appdb"
}

variable "rds_username" {
  description = "RDS master username."
  type        = string
  default     = "admin"
}

variable "rds_master_password" {
  description = "RDS master password. Pass with TF_VAR_rds_master_password or a local tfvars file."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.rds_master_password) >= 8
    error_message = "RDS master password must be at least 8 characters long."
  }
}

variable "rds_allowed_cidr_blocks" {
  description = "CIDR blocks allowed to connect to RDS."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance."
  type        = string
  default     = "ami-00c39f71452c08778"
}

variable "ec2_instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "ec2_associate_public_ip_address" {
  description = "Whether to associate a public IP address with the EC2 instance."
  type        = bool
  default     = true
}

variable "ec2_allowed_ssh_cidr_blocks" {
  description = "CIDR blocks allowed to SSH into the EC2 instance."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ec2_key_name" {
  description = "Optional EC2 key pair name to create from .ssh/terraform-learning_ed25519.pub."
  type        = string
  default     = null
}
