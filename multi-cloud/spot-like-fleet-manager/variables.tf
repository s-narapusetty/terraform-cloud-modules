variable "aws_enabled" {
  type        = bool
  description = "Enable AWS Spot Instance module"
  default     = false
}

variable "azure_enabled" {
  type        = bool
  description = "Enable Azure Low Priority VM module"
  default     = false
}

variable "gcp_enabled" {
  type        = bool
  description = "Enable GCP Preemptible VM module"
  default     = false
}

variable "name_prefix" {
  type        = string
  description = "Prefix to apply to all resources"
  default     = "multi-cloud"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default     = {}
}
