output "asg_name" {
  description = "Name of the AWS Auto Scaling Group"
  value       = aws_autoscaling_group.spot_fleet.name
}
