variable "vpc_id" {
  description = "VPC ID where security group is attached"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}

