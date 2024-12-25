variable "project-id" {
    type = string
    description = "It's a GCP Project ID"
    sensitive = true
}
variable "region" {
    type = string
    description = "Region in which the service will be deployed"
}
variable "vpc_network_name" {
    type = string
    description = "VPC network name"
}
variable "vpc_network_description" {}
variable "public_subnet_name" {
    type = string
    description = "public-subnet name"
}
variable "public_subnet_ip_range" {
    type = string
    description = "ip range for public-subnet"
}
variable "compute_router_name" {
    type = string
    description = "compute router name"
}
variable "compute_router_nat_name" {
    type = string
    description = "compute router nat name"
}
variable "compute_instance_template_name" {
    type = string
    description = "compute instance template name"
}
variable "compute_instance_group_manager_name" {
    type = string
    description = "compute instance group manager name"
}
variable "instance_name" {
    type = list(string)
    description = "instance name"
}
variable "machine_type" {
    type = string  
}
variable "source_image" {
    type = string  
}
variable "instance_target_size" {
    type = number
    description = "number of intstances to be created"
  
}
variable "compute_global_address_name" {
  type = string
}
variable "compute_target_http_proxy_name" {
    type = string  
}
variable "compute_url_map_name" {
    type = string
  
}
variable "compute_backend_service_name" {
    type = string  
}
variable "sql_user" {
    type = string
    sensitive = true
  
}
variable "sql_password" {
    type = string
    sensitive = true
}
locals {
  modified_instance_name=[for instance_name in var.instance_name : "prod-${instance_name}"]
}
variable "db_instance_name" {
    type = string  
}
variable "db_version_name" {
    type = string  
}
variable "credentials" {
  
}