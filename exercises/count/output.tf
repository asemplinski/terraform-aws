output "first_ARN" {
    description = "ARN for the first user created"
    value = aws_iam_user.user[0]
  
}

output "all_ARNs" {
  description = "All ARNs of the users created"
  value = aws_iam_user.user[*]
}