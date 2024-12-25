variable "sql_user" {
    type = string
    sensitive = true
  
}
variable "sql_password" {
    type = string
    sensitive = true
}
variable "db_instance_name" {
    type = string  
}
variable "db_version_name" {
    type = string  
}