resource "google_compute_network" "vpc_network" {
  name = var.vpc_network_name
  description = "VPC for web app"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = var.public_subnet_name
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.id
  region        = "us-central1"
}

resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.id
  
  allow {
    protocol = "ssh"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]  # Allows access from anywhere
}

resource "google_compute_router" "default_router" {
  name    = "my-router"
  region  = "us-central1"
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "default_router_nat" {
  name   = "my-nat"
  router = google_compute_router.default_router.name
  region = "us-central1"

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name = var.public_subnet_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}