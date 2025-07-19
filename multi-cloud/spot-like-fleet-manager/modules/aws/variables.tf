variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "name_prefix" {
  description = "Name prefix for resources"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for ASG"
  type        = list(string)
}

variable "max_size" {
  description = "Max size of ASG"
  type        = number
}

variable "min_size" {
  description = "Min size of ASG"
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of instances"
  type        = number
}

variable "tags" {
  description = "Map of tags"
  type        = map(string)
  default     = {}
}
