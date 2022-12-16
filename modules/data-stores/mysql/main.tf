terraform {
  required_providers {
    aws = {
      source="hashicorp/aws"
      version="~> 4.0"
    }
  }
}


//noinspection ConflictingProperties
resource "aws_db_instance" "mysql" {
  identifier_prefix = "heeler"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  skip_final_snapshot = true

  backup_retention_period = var.backup_retention_period
  replicate_source_db = var.replicate_source_db

  engine =  var.replicate_source_db == null ? "mysql": null
  db_name = var.replicate_source_db == null ? var.db_name: null
  username = var.replicate_source_db == null ? var.db_username :  null
  password = var.replicate_source_db == null ? var.db_password : null



}