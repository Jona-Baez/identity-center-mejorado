output "group_id" {
  description = "ID del grupo creado"
  value       = aws_identitystore_group.group[0].group_id
}

output "permission_set_arn" {
  description = "ARN del permission set creado"
  value       = aws_ssoadmin_permission_set.permission.arn
}
