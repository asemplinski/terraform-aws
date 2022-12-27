terraform {
  required_version = ">= 1.0.0, < 2.0.0"
}

module "simple_webapp" {
  source = "../../modules/services/k8s-app"

  name = "simple-webapp"
  image = "training/webapp"
  replicas = 2
  container_port = 5000
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "docker-desktop"
}