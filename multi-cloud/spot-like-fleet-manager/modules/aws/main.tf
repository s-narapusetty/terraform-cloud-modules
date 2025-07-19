resource "aws_launch_template" "spot_template" {
  name_prefix   = var.name_prefix
  image_id      = var.ami
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      var.tags,
      {
        "Name" = "${var.name_prefix}-spot-instance"
      }
    )
  }
}

resource "aws_autoscaling_group" "spot_fleet" {
  name_prefix          = var.name_prefix
  max_size             = var.max_size
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.subnet_ids

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.spot_template.id
        version            = "$Latest"
      }

      overrides {
        instance_type = var.instance_type
      }
    }

    instances_distribution {
      on_demand_base_capacity                   = 0
      on_demand_percentage_above_base_capacity = 0
      spot_allocation_strategy                  = "lowest-price"
    }
  }

  termination_policies     = ["OldestInstance"]
  health_check_type        = "EC2"
  health_check_grace_period = 300

  tags = [
    for key, value in merge(var.tags, {"Name" = "${var.name_prefix}-asg"}) : {
      key                 = key
      value               = value
      propagate_at_launch = true
    }
  ]
}

output "asg_name" {
  value = aws_autoscaling_group.spot_fleet.name
}
