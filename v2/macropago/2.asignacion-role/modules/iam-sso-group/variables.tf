variable "identity_store_id" {
  description = "ID del Identity Store de AWS SSO"
  type        = string
}

variable "accounts" {
  type        = list(string)
  description = "Cuentas AWS donde se asignará este role"
}

variable "group_name" {
  description = "Nombre del grupo a crear"
  type        = string
}

variable "permission_set_name" {
  description = "Nombre del permission set"
  type        = string
}

variable "aws_managed_policies" {
  description = "Lista de ARNs de políticas administradas por AWS"
  type        = set(string)
}

variable "custom_managed_policies" {
  description = "Lista de nombres de políticas personalizadas ya creadas en IAM"
  type        = set(string)
}

variable "gmail_users" {
  description = "Correos Gmail de usuarios a agregar al grupo"
  type        = set(string)
}

variable "group_description" {
  type        = string
  description = "Descripción del grupo"
}