output "aws_instance_ids" {
  description = "List of instance IDs from AWS module"
  value       = module.aws_spot.instances
  condition   = var.aws_enabled
}

output "azure_vmss_id" {
  description = "ID of Azure VM Scale Set"
  value       = module.azure_vmss.vmss_id
  condition   = var.azure_enabled
}

output "gcp_instance_group_id" {
  description = "ID of GCP Instance Group"
  value       = module.gcp_preemptible.instance_group
  condition   = var.gcp_enabled
}
