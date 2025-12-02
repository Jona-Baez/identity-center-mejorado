variable "identity_store_id" {
  description = "El ID del AWS Identity Store"
  type        = string
}

variable "groups_config" {
  description = "Lista de configuración para cada grupo"
  type = list(object({
    accounts          = list(string)
    group_name              = string
    permission_set_name     = string
    group_description       = string
    aws_managed_policies    = set(string)
    custom_managed_policies = set(string)
    gmail_users             = set(string)
  }))
}
