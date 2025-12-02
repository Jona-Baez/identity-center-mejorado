provider "aws" {
  region = "us-east-1"
}

module "iam_sso_groups" {
  source = "./modules/iam-sso-group"

  # Un módulo por "role"/grupo del JSON
  for_each = {
    for group in var.groups_config :
    group.group_name => group
  }

  identity_store_id       = var.identity_store_id

  # 👇 Ahora el módulo recibe TODAS las cuentas
  accounts                = each.value.accounts

  group_name              = each.value.group_name
  permission_set_name     = each.value.permission_set_name
  group_description       = each.value.group_description
  aws_managed_policies    = each.value.aws_managed_policies
  custom_managed_policies = each.value.custom_managed_policies
  gmail_users             = each.value.gmail_users
}
