data "google_iam_role" "role_info" {
  for_each = toset(var.custom_role.predefined_roles)
  name     = each.value
}

locals {
  role_permissions = concat(flatten(values(data.google_iam_role.role_info)[*].included_permissions), var.custom_role.additional_permissions)
  permissions = [
    for permission in local.role_permissions :
    permission if ! contains(var.custom_role.excluded_permissions, permission)
  ]
}

resource "google_organization_iam_custom_role" "custom_role" {
  org_id      = var.org_id
  role_id     = var.custom_role.role_id
  title       = var.custom_role.title
  description = var.custom_role.description
  permissions = local.permissions
}