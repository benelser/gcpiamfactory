# Gets all files in iamcustomroles directory and decodes the json to pass through to the iam generator
locals {
  custom_roles  = fileset(var.path_to_custom_roles, "*")
}

module "custom_role" {
  for_each    = toset(local.custom_roles[*])
  source      = "./modules/custom-role-generator"
  org_id      = data.google_organization.org.org_id
  custom_role = jsondecode(file("${var.path_to_custom_roles}/${each.key}"))
}