output "autoscaling_group_name" {
  description = "DNS name of the Load Balance"
  value = aws_autoscaling_group.example.name
}
