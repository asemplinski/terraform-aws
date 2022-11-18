


output "autoscaling_group_name" {
  description = "DNS name of the Application Load Balancer"
  value = module.webserver_cluster.autoscaling_group_name
}