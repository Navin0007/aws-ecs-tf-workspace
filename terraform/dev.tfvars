aws_region     = "ap-south-1"
vpc_cidr       = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
cluster_name   = "dev-ecs-cluster"
ami_id         = "ami-xxxxxxxxxxxxx"   # Replace with your ECS Optimized AMI ID
instance_type  = "t3.medium"
environment    = "dev"

