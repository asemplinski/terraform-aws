variable "db_name" {
  description = "Name of the DB"
  type = string
  default = null
}

variable "db_username" {
  description = "username to be used for the DB"
  type = string
  sensitive = true
  default = null
}

variable "db_password" {
    description = "password to be used for the DB"
    type = string
    sensitive = true
  default = null
}

variable "backup_retention_period" {
  description = "Retention period for DB backups"
  type = number
  default = null
}

variable "replicate_source_db" {
  description = "Flag that determines whether to replicate the source DB or not"
  type = string
  default = null
}