output "autoscaling_group_name" {
  description = "Name of the Autoscaling Group"
  value = module.webserver_cluster.autoscaling_group_name
}

output "alb_dns_name" {
  description = "DNS Name of the application Load Balancer"
  value = module.webserver_cluster.alb_dns_name
}