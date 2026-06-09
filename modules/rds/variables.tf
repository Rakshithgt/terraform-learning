variable "identifier" {
  description = "RDS instance identifier."
  type        = string
}

variable "subnet_ids" {
  description = "Private subnets for the RDS subnet group."
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where RDS security group is created."
  type        = string
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to connect to the database."
  type        = list(string)
}

variable "engine" {
  description = "Database engine."
  type        = string
}

variable "engine_version" {
  description = "Database engine version."
  type        = string
}

variable "instance_class" {
  description = "RDS instance class."
  type        = string
}

variable "allocated_storage" {
  description = "Allocated RDS storage in GB."
  type        = number
}

variable "db_name" {
  description = "Initial database name."
  type        = string
}

variable "username" {
  description = "RDS master username."
  type        = string
}

variable "password" {
  description = "RDS master password."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags applied to RDS resources."
  type        = map(string)
  default     = {}
}
