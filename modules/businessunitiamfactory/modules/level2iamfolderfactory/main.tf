resource "google_folder_iam_binding" "component_level2_iam_bindings"{
  count = length(var.component.component_level2_iam_bindings)
  folder = var.component.folder_id
  role    = var.component.component_level2_iam_bindings[count.index].role
  members = var.component.component_level2_iam_bindings[count.index].members
}

module "component_level3_iam_bindings" {
  count = length(var.component.environment_level3_iam_bindings)
  source     = "../level3iamfolderfactory"
  org_domain = var.org_domain
  environment_level3_iam_binding = var.component.environment_level3_iam_bindings[count.index]
}
