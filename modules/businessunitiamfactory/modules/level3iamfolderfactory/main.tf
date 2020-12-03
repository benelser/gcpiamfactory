resource "google_folder_iam_binding" "component_level2_iam_bindings"{
  count = length(var.environment_level3_iam_binding.iam_bindings)
  folder = var.environment_level3_iam_binding.folder_id
  role    = var.environment_level3_iam_binding.iam_bindings[count.index].role
  members = var.environment_level3_iam_binding.iam_bindings[count.index].members
}