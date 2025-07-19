variable "name_prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to attach VMSS"
  type        = string
}

variable "vm_size" {
  description = "VM size (SKU)"
  type        = string
  default     = "Standard_B1ms"
}

variable "desired_capacity" {
  description = "Number of VMs in scale set"
  type        = number
  default     = 1
}

variable "admin_username" {
  description = "Admin username"
  type        = string
}

variable "admin_password" {
  description = "Admin password"
  type        = string
  sensitive   = true
}

variable "vm_image_publisher" {
  description = "VM Image Publisher"
  type        = string
  default     = "Canonical"
}

variable "vm_image_offer" {
  description = "VM Image Offer"
  type        = string
  default     = "UbuntuServer"
}

variable "vm_image_sku" {
  description = "VM Image SKU"
  type        = string
  default     = "18.04-LTS"
}

variable "tags" {
  description = "Tags for resources"
  type        = map(string)
  default     = {}
}
