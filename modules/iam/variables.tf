variable "environment" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}

variable "instance_role_suffix" {
  description = "Suffix to customize IAM role name"
  type        = string
}