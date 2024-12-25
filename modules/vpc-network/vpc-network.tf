resource "google_compute_network" "vpc_network" {
  name = var.vpc_network_name
  description = "VPC for web app"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = var.public_subnet_name
  ip_cidr_range = var.public_subnet_ip_range
  network       = google_compute_network.vpc_network.id
  region        = var.region
}

resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.id
  
  allow {
    protocol = "ssh"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_router" "default_router" {
  name    = var.compute_router_name
  region  = var.region
  network = google_compute_network.vpc_network.id
}

resource "google_compute_router_nat" "default_router_nat" {
  name   = var.compute_router_nat_name
  router = google_compute_router.default_router.name
  region = var.region

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name = var.public_subnet_name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}