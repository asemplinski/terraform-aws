output "alb_dns_name" {
  description = "DNS name of the Load Balance"
  value = aws_lb.example.dns_name
}
