output "endpoint" {
  description = "RDS endpoint."
  value       = aws_db_instance.this.endpoint
}

output "security_group_id" {
  description = "RDS security group ID."
  value       = aws_security_group.this.id
}
