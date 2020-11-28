locals {
  custom_roles  = fileset(var.path_to_custom_roles, "*")
}

module "custom_role" {
  for_each    = toset(local.custom_roles)
  source      = "./modules/custom-role-generator"
  org_domain      = var.org_domain
  custom_role = jsondecode(file("${var.path_to_custom_roles}/${each.key}"))
}