aws_region     = "ap-south-1"
vpc_cidr       = "10.1.0.0/16"
public_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnets = ["10.1.101.0/24", "10.1.102.0/24"]
cluster_name   = "qa-ecs-cluster"
ami_id         = "ami-xxxxxxxxxxxxx"  # Replace with your ECS Optimized AMI ID
instance_type  = "t3.medium"
environment    = "qa"

