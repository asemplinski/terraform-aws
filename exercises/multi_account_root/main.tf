terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
  region = "us-east-2"
  alias = "parent"
}

provider "aws" {
  region = "us-east-2"
  alias = "child"

  assume_role {
    role_arn = "arn:aws:iam::004504437198:role/OrganizationAccountAccessRole"
  }
}
module "multi-account" {
  source = "../../modules/multi-account"
  providers = {
    aws.parent = aws.parent
    aws.child = aws.child
  }
}