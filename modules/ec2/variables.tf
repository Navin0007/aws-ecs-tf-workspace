variable "subnet_ids" {
  description = "Subnet IDs where ECS instances will run"
  type        = list(string)
}

variable "cluster_name" {
  description = "ECS Cluster name to join"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for ECS EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance type for ECS nodes"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 Key Pair for SSH access"
  type        = string
}


