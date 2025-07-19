output "vmss_id" {
  description = "Azure VM Scale Set ID"
  value       = azurerm_virtual_machine_scale_set.low_priority_vmss.id
}
