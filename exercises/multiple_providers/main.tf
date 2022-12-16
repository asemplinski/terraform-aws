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
  alias = "aws_east"
}

provider "aws" {
  region = "us-west-1"
  alias = "aws_west"
}

resource "aws_instance" "east" {
  provider = aws.aws_east

  ami = data.aws_ami.ubuntu-east.id
  instance_type = "t2.micro"
}

resource "aws_instance" "west" {
  provider = aws.aws_west

  ami = data.aws_ami.ubuntu-west.id
  instance_type = "t2.micro"
}


data "aws_region" "east_region" {
  provider = aws.aws_east
}

data "aws_region" "west_region" {
  provider = aws.aws_west
}

data "aws_ami" "ubuntu-east" {
  provider = aws.aws_east

  most_recent = true
  owners      = ["099720109477"] #canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

data "aws_ami" "ubuntu-west" {
  provider = aws.aws_west

  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}