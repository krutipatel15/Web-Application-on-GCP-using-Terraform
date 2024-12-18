resource "google_compute_instance_template" "web_template" {
  name        = var.compute_instance_template_name
  machine_type = "e2-medium"

  disk {
    boot         = true
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.id
    access_config {}
  }
}

resource "google_compute_instance_group_manager" "web_instances" {
  name               = var.compute_instance_group_manager_name
  zone = var.region
  base_instance_name = "instance"
  version {
    instance_template = google_compute_instance_template.web_template.self_link
  }
  target_size        = 3
}