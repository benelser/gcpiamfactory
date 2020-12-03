resource "google_folder_iam_binding" "bizunit_level1_iam_bindings"{
  count = length(var.business_unit.bizunit_level1_iam_bindings)
  folder = var.business_unit.folder_id
  role    = var.business_unit.bizunit_level1_iam_bindings[count.index].role
  members = var.business_unit.bizunit_level1_iam_bindings[count.index].members
}

module "component_level2_iam_bindings" {
  count = length(var.business_unit.components)
  source     = "./modules/level2iamfolderfactory"
  org_domain = var.org_domain
  component = var.business_unit.components[count.index]
}