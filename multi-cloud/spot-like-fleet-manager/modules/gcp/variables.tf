variable "name_prefix" {
  description = "Prefix for resources"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "machine_type" {
  description = "Machine type"
  type        = string
  default     = "e2-micro"
}

variable "source_image" {
  description = "OS image to use"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "network" {
  description = "Network to attach instances"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork to attach instances"
  type        = string
}

variable "target_size" {
  description = "Number of instances"
  type        = number
  default     = 1
}

variable "startup_script" {
  description = "Startup script"
  type        = string
  default     = "#!/bin/bash\necho Hello from $(hostname)"
}

variable "health_check" {
  description = "Health check URL for auto-healing"
  type        = string
}

variable "tags" {
  description = "Tags for the instance template"
  type        = map(string)
  default     = {}
}
