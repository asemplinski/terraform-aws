output "autoscaling_group_name" {
  description = "DNS name of the Load Balance"
  value = aws_autoscaling_group.example.name
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value  = aws_lb.example.dns_name
  
}