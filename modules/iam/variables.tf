variable "cluster_name" {
  description = "EKS cluster name used for IAM role names."
  type        = string
}

variable "tags" {
  description = "Tags applied to IAM roles."
  type        = map(string)
  default     = {}
}
