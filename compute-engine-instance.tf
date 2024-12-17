resource "google_compute_instance_template" "web_template" {
  name        = "web-instance-template"
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
  name               = "web-instance-group"
  zone = "us-central1-a"
  base_instance_name = "instance"
  version {
    instance_template = google_compute_instance_template.web_template.self_link
  }
  target_size        = 3
}
