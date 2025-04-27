terraform {
  required_version = ">= 1.3.0"
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

module "vpc" {
  source = "../modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  environment = var.environment
}

module "ecs_cluster" {
  source = "../modules/ecs-cluster"
  #cluster_name = var.cluster_name-
  environment = var.environment
}

module "ec2" {
  source = "../modules/ec2"
  cluster_name = module.ecs_cluster.cluster_name
  subnet_ids = module.vpc.private_subnet_ids
  ami_id = var.ami_id
  instance_type = var.instance_type
  environment = var.environment
}

module "iam" {
  source = "../modules/iam"
  environment = var.environment
}

module "security_groups" {
  source = "../modules/security-groups"
  vpc_id = module.vpc.vpc_id
  environment = var.environment
}

