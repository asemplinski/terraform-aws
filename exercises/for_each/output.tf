output "all_users" {
  value = module.users
}

output "all_arns" {
  value = values(module.users)[*].user_arn
}