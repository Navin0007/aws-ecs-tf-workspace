resource "aws_launch_template" "ecs" {
  name_prefix   = "${var.environment}-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = var.use_ecs ? base64encode(<<-EOF
              #!/bin/bash
              echo ECS_CLUSTER=${var.cluster_name} >> /etc/ecs/ecs.config
              EOF
            ) : null

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.environment}-instance"
      Environment = var.environment
    }
  }
}

resource "aws_autoscaling_group" "ecs_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = aws_launch_template.ecs.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.environment}-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "scale_out" {
  count                  = var.use_ecs ? 1 : 0
  name                   = "${var.environment}-scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ecs_asg.name
}

resource "aws_autoscaling_policy" "scale_in" {
  count                  = var.use_ecs ? 1 : 0
  name                   = "${var.environment}-scale-in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.ecs_asg.name
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  count               = var.use_ecs ? 1 : 0
  alarm_name          = "${var.environment}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_actions       = [aws_autoscaling_policy.scale_out[0].arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ecs_asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  count               = var.use_ecs ? 1 : 0
  alarm_name          = "${var.environment}-low-cpu"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 30
  alarm_actions       = [aws_autoscaling_policy.scale_in[0].arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.ecs_asg.name
  }
}
