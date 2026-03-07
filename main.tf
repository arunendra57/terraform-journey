terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# DATA SOURCE — fetch existing default VPC
data "aws_vpc" "default" {
  default = true
}

# DATA SOURCE — fetch existing subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Use data source in EC2
resource "aws_instance" "my_server" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = var.instance_type
  subnet_id     = data.aws_subnets.default.ids[0]

  tags = {
    Name        = "My-Day3-Server"
    Environment = var.environment
    Day         = "Day3"
  }
}