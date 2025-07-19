resource "google_compute_instance_template" "preemptible_template" {
  name_prefix  = "${var.name_prefix}-template"
  machine_type = var.machine_type
  region       = var.region

  disk {
    source_image = var.source_image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
    access_config {}
  }

  scheduling {
    preemptible       = true
    automatic_restart = false
    on_host_maintenance = "TERMINATE"
  }

  metadata = {
    startup-script = var.startup_script
  }

  tags = var.tags
}

resource "google_compute_region_instance_group_manager" "preemptible_mig" {
  name               = "${var.name_prefix}-mig"
  region             = var.region
  base_instance_name = var.name_prefix
  version {
    instance_template = google_compute_instance_template.preemptible_template.id
  }

  target_size = var.target_size

  auto_healing_policies {
    health_check      = var.health_check
    initial_delay_sec = 60
  }

  update_policy {
    type                    = "OPPORTUNISTIC"
    minimal_action          = "REPLACE"
    max_surge_fixed         = 1
    max_unavailable_fixed   = 0
  }

  named_port {
    name = "http"
    port = 80
  }
}
