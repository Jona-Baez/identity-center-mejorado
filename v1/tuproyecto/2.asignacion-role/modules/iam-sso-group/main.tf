data "aws_ssoadmin_instances" "sso_instance" {}

# 🔹 Crear grupo siempre (Terraform detectará si ya existe por display_name)
resource "aws_identitystore_group" "group" {
  count             = 1
  identity_store_id = var.identity_store_id
  display_name      = var.group_name
  description       = var.group_description
}

# 🔹 Crear siempre el Permission Set
resource "aws_ssoadmin_permission_set" "permission" {
  instance_arn     = tolist(data.aws_ssoadmin_instances.sso_instance.arns)[0]
  name             = var.permission_set_name
  description      = "Permission Set en AWS Identity Center"
  session_duration = "PT4H"
}

# 🔹 Referencia directa
locals {
  permission_set_arn = aws_ssoadmin_permission_set.permission.arn
  group_id           = aws_identitystore_group.group[0].group_id
}

resource "aws_ssoadmin_account_assignment" "assignment" {
  for_each = toset(var.accounts)

  instance_arn       = tolist(data.aws_ssoadmin_instances.sso_instance.arns)[0]
  permission_set_arn = local.permission_set_arn
  principal_id       = local.group_id
  principal_type     = "GROUP"
  target_type        = "AWS_ACCOUNT"
  target_id          = each.value
}


resource "aws_ssoadmin_managed_policy_attachment" "aws_policies" {
  for_each = { for p in var.aws_managed_policies : p => p }

  instance_arn       = tolist(data.aws_ssoadmin_instances.sso_instance.arns)[0]
  permission_set_arn = local.permission_set_arn
  managed_policy_arn = each.value
}

resource "aws_ssoadmin_customer_managed_policy_attachment" "custom_policies" {
  for_each = { for p in var.custom_managed_policies : p => p }

  instance_arn       = tolist(data.aws_ssoadmin_instances.sso_instance.arns)[0]
  permission_set_arn = local.permission_set_arn

  customer_managed_policy_reference {
    name = each.value
    path = "/"
  }
}

data "aws_identitystore_user" "users" {
  for_each = var.gmail_users

  identity_store_id = var.identity_store_id
  alternate_identifier {
    unique_attribute {
      attribute_path  = "UserName"
      attribute_value = each.key
    }
  }
}

resource "aws_identitystore_group_membership" "memberships" {
  for_each = { for u in var.gmail_users : u => u }

  identity_store_id = var.identity_store_id
  group_id          = local.group_id
  member_id         = data.aws_identitystore_user.users[each.key].id
}
