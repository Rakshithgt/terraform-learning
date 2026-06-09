output "bucket_name" {
  description = "Terraform state bucket name."
  value       = aws_s3_bucket.backend.bucket
}

output "dynamodb_table_name" {
  description = "Terraform state lock table name."
  value       = aws_dynamodb_table.locks.name
}
