variable "environment" {
  description = "Environment name (dev, qa, prod)"
  type        = string
}

variable "execution_role_arn" {
  description = "IAM Role ARN for ECS Task Execution"
  type        = string
}

