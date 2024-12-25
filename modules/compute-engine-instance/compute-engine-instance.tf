resource "google_compute_instance_template" "web_template" {
  name        = var.compute_instance_template_name
  machine_type = var.machine_type

  disk {
    boot         = true
    source_image = var.source_image
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
  for_each = toset(local.modified_instance_name)
  base_instance_name = each.value
  version {
    instance_template = google_compute_instance_template.web_template.self_link
  }
  target_size        = var.instance_target_size
}