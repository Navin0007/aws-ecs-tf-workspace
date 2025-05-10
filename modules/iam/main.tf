/*resource "aws_iam_role" "ecs_instance_role" {
  name = "${var.environment}-ecs-instance-role"
  name = "${var.environment}-${var.instance_role_suffix}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-ecs-instance-role"
  }
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role_attach" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}*/



resource "aws_iam_role" "instance_role" {
  name = "${var.environment}-${var.instance_role_suffix}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name        = "${var.environment}-${var.instance_role_suffix}"
    Environment = var.environment
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.environment}-${var.instance_role_suffix}-profile"
  role = aws_iam_role.instance_role.name
}

resource "aws_iam_role_policy_attachment" "attach_ec2_policy" {
  role       = aws_iam_role.instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"  # Example policy — customize as needed
}

output "instance_profile_name" {
  description = "Name of the IAM instance profile"
  value       = aws_iam_instance_profile.instance_profile.name
}

output "ec2_instance_role_name" {
  value = aws_iam_role.instance_role.name
}