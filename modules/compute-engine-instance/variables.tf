variable "region" {
    type = string
    description = "Region in which the service will be deployed"
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
locals {
  modified_instance_name=[for instance_name in var.instance_name : "prod-${instance_name}"]
}