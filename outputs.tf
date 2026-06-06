output "alb_url" {
  description = "Application URL"
  value       = "http://${module.compute.alb_dns_name}"
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "db_endpoint" {
  description = "Database Endpoint"
  value       = module.database.db_endpoint
}

output "s3_bucket" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.app_storage.bucket
}

output "asg_name" {
  description = "Auto Scaling Group Name"
  value       = module.compute.asg_name
}