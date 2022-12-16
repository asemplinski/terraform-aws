output "parent_account_id" {
  value = data.aws_caller_identity.parent.id
  description = "ID of the parent AWS Account"
}

output "child_account_id" {
  value = data.aws_caller_identity.child.id
  description = "ID of the child AWS account"
}