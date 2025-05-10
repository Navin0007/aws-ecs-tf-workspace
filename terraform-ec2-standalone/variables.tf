variable "environment" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "vpc_cidr" {}
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "instance_count" {}
variable "volume_size" {}
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}