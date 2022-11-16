variable "db_username" {
  description = "username to be used for the DB"
  type = string
  sensitive = true
}

variable "db_password" {
    description = "password to be used for the DB"
    type = string
    sensitive = true
}