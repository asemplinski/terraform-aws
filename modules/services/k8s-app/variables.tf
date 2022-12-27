variable "name" {
  description = "The name to use for all resources creatd by this module"
  type = string
}

variable "image" {
  description = "Docker image to run"
  type = string
}

variable "container_port" {
  description = "Port that the docker image listens on"
  type = number
}

variable "replicas" {
  description = "number of replicas to maintain"
  type = number
}

variable "environment_variables" {
  description = "Environment variables to set for the app"
  type = map(string)
  default = {}
}