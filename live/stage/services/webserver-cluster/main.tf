terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "terraform-up-and-running-state-69"
    key = "stage/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt = true
  }
}

provider "aws" {
    region = "us-east-2"
}


module "webserver_cluster"{
  source = "../../../../modules/services/webserver-cluster"

  cluster_name = "webservers-stage"
  ami = "ami-0fb653ca2d3203ac1"
  server_text = "This will Replace the text"

  db_remote_state_bucket = "terraform-up-and-running-state-69"
  db_remote_state_key = "stage/data-store/mysql/terraform.tfstate"

  enable_autoscaling = false

}