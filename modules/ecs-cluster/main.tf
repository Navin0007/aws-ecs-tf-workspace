resource "aws_ecs_cluster" "this" {
  name = "${var.environment}-ecs-cluster"

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-ecs-cluster"
  }
}

output "cluster_id" {
  value = aws_ecs_cluster.this.id
}

