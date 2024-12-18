provider "google" {
  project     = var.project-id
  region      = var.region
  credentials = file("C:\\Users\\Kruti\\Desktop\\Web Application on GCP using Terraform\\gcp-serviceaccount.json")
}