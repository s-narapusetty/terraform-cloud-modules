output "mig_id" {
  description = "Managed Instance Group ID"
  value       = google_compute_region_instance_group_manager.preemptible_mig.id
}
