output "vpc_id" {
  description = "Default VPC ID"
  value       = data.aws_vpc.default.id
}

output "subnet_ids" {
  description = "Available Subnet IDs"
  value       = data.aws_subnets.default.ids
}

output "server_ip" {
  description = "Server Public IP"
  value       = aws_instance.my_server.public_ip
}