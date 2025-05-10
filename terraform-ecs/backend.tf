terraform {
  backend "s3" {
    bucket         = "terraform-ecs-dem"
    key            = "ecs-workspace/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-ecs-dem"
  }
}

