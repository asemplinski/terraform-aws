terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "terraform-up-and-running-state-69"
    key = "prod/services/webserver-cluster/terraform.tfstate"
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

  cluster_name = "webservers-prod"
  db_remote_state_bucket = "terraform-up-and-running-state-69"
  db_remote_state_key = "prod/data-store/mysql/terraform.tfstate"

  instance_type = "t2.micro"
  min-size = 2
  max-size = 10
  enable_autoscaling = true

  custom_tags = {
      Owner = "team-foo"
      ManagedBy = "terraform"
    }

}

