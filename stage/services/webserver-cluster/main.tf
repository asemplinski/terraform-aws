terraform {
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
    source = "../../../modules/services/webserver-cluster"

    cluster_name = "webservers-stage"
    db_remote_state_bucket = "terraform-up-and-running-state-69"
    db_remote_state_key = "stage/data-store/mysql/terraform.tfstate"

}