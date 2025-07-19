variable "cloud_provider" {
  description = "Cloud provider: aws, azure, or gcp"
  type        = string
}

variable "name_prefix" {
  description = "Name prefix for resources"
  type        = string
}

variable "ami" {
  description = "AMI ID (AWS only)"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_ids" {
  description = "Subnet IDs (AWS/GCP/Azure)"
  type        = list(string)
  default     = []
}

variable "max_size" {
  description = "Max size for autoscaling"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Min size for autoscaling"
  type        = number
  default     = 1
}

variable "desired_capacity" {
  description = "Desired capacity"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}

module "aws_spot_fleet" {
  source         = "./modules/aws"
  count          = var.cloud_provider == "aws" ? 1 : 0
  name_prefix    = var.name_prefix
  ami            = var.ami
  instance_type  = var.instance_type
  subnet_ids     = var.subnet_ids
  max_size       = var.max_size
  min_size       = var.min_size
  desired_capacity = var.desired_capacity
  tags           = var.tags
}

output "asg_name" {
  description = "AWS Auto Scaling Group name"
  value       = length(module.aws_spot_fleet) > 0 ? module.aws_spot_fleet[0].asg_name : ""
  depends_on  = [module.aws_spot_fleet]
}
