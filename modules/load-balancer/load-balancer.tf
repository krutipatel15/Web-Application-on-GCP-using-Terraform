resource "google_compute_global_address" "default" {
  name = var.compute_global_address_name
}
resource "google_compute_target_http_proxy" "http_proxy" {
  name        = var.compute_target_http_proxy_name
  url_map     = google_compute_url_map.url_map.id
}
resource "google_compute_url_map" "url_map" {
  name            = var.compute_url_map_name
  default_service = google_compute_backend_service.default.id
}
resource "google_compute_backend_service" "default" {
  name            = "web-backend"
  backend {
    group = google_compute_instance_group_manager.web_instances.instance_group
}
}