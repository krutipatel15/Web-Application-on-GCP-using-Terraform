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
    type = number
    description = "ip range for public-subnet"
}