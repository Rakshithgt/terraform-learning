variable "cluster_name" {
  description = "EKS cluster name."
  type        = string
}

variable "cluster_role_arn" {
  description = "IAM role ARN for EKS control plane."
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for EKS managed node group."
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for EKS cluster and nodes."
  type        = list(string)
}

variable "node_instance_type" {
  description = "EC2 instance type for EKS managed nodes."
  type        = string
}

variable "desired_capacity" {
  description = "Desired EKS node count."
  type        = number
}

variable "min_capacity" {
  description = "Minimum EKS node count."
  type        = number
}

variable "max_capacity" {
  description = "Maximum EKS node count."
  type        = number
}

variable "tags" {
  description = "Tags applied to EKS resources."
  type        = map(string)
  default     = {}
}
