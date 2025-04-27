terraform {
  backend "s3" {
    bucket         = "your-terraform-backend-bucket"
    key            = "ecs-workspace/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "your-terraform-lock-table"
  }
}

