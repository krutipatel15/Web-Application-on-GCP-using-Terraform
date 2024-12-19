resource "google_sql_database_instance" "db-instance" {
  name             = var.db_instance_name
  database_version = var.db_version_name
  settings {
    tier = "db-n1-standard-1"
  }
}

resource "google_sql_user" "sql-user" {
  name     = var.sql_user
  password = var.sql_password
  instance = google_sql_database_instance.db-instance.name
}
