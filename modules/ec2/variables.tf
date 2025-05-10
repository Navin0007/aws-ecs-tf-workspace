variable "subnet_ids" {
  description = "Subnet IDs where EC2 instances will launch"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance type"
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

variable "use_ecs" {
  description = "Whether to configure EC2 instances for ECS cluster"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "ECS Cluster name to join (used only if use_ecs = true)"
  type        = string
  default     = null
}

variable "instance_name_suffix" {
  description = "Custom suffix for the EC2 Name tag (e.g., 'ecs', 'standalone')"
  type        = string
  default     = "instance"
}

variable "iam_instance_profile" {
  description = "Name of the IAM instance profile"
  type        = string
}