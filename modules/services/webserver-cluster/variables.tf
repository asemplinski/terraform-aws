variable "cluster_name" {
  description = "The name to user for all the cluster resources"
  type = string
}

variable "db_remote_state_bucket" {
  description = "The bucket used for the database's remote state"
  type = string
}

variable "db_remote_state_key" {
    description = "The path for the database's remote state"
    type = string 
}

variable "instance_type" {
  description = "Sets the type of instance"
  type = string
  default = "t2.micro"
}

variable "min-size" {
  description = "Sets the min size of the Auto Scaling Group"
  type = number
  default = 2
}

variable "max-size"{
  description = "Sets the max size of the Auto Scaling Group"
  type = number
  default = 2
}



variable "server_port" {
    description = "The port the server will use for HTTP Requests"
    type = number
    default = 8080
}

