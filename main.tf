module "compute-engine" {
  source = "./modules/compute-engine-instance"
  region = var.region
  machine_type = var.machine_type
  compute_instance_group_manager_name = var.compute_instance_group_manager_name
  compute_instance_template_name = var.compute_instance_template_name
  source_image = var.source_image
  instance_target_size = var.instance_target_size
  instance_name = var.instance_name
}

module "database" {
  source = "./modules/database"
  sql_password = var.sql_password
  sql_user = var.sql_user
  db_version_name = var.db_version_name
  db_instance_name = var.db_instance_name
}

module "load-balancer" {
  source = "./modules/load-balancer"
  compute_backend_service_name = var.compute_backend_service_name
  compute_url_map_name = var.compute_url_map_name
  compute_global_address_name = var.compute_global_address_name
  compute_target_http_proxy_name = var.compute_target_http_proxy_name
}

module "vpc-network" {
  source = "./modules/vpc-network"
  vpc_network_description = var.vpc_network_description
  vpc_network_name = var.vpc_network_name
  region = var.region
  public_subnet_name = var.public_subnet_name
  public_subnet_ip_range = var.public_subnet_ip_range
  compute_router_name = var.compute_router_name
  compute_router_nat_name = var.compute_router_nat_name
}