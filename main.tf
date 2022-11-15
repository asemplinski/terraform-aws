provider "aws" {
    region = "us-east-2"
}

variable "server_port" {
    description = "The port the server will use for HTTP Requests"
    type = number
    default = 8080
}

output "public_ip" {
  description = "Returns the public IP address of the EC2 instance"
  value = aws_instance.example.public_ip
}

 
resource "aws_instance" "example" {
  ami = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  vpc_security_group_ids =  [aws_security_group.instance.id]
  tags = {
    "Name" = "terraform-example"
  }

    user_data = <<-EOF
            #! /bin/bash
            echo "Hello, World!" > index.html
            nohup busybox httpd -f -p ${var.server_port} &
            EOF
    user_data_replace_on_change = true
}

resource "aws_security_group" "instance" {
    name = "terraform_example_SG"

    ingress {
            from_port = var.server_port
            to_port = var.server_port
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
    }

}
