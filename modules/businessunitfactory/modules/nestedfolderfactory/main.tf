resource "google_folder" "child_folder" {
  parent = var.parent
  display_name = var.name
}

resource "google_folder" "child_nested_folder" {
  for_each = toset(var.childfoldername)
  parent = google_folder.child_folder.name
  display_name = each.key
}



## Test until gather more infor on api activation

locals {
  common_apis = concat(["compute.googleapis.com"], var.product.activate_apis)
}

module "project" {
  for_each = toset(var.childfoldername)
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 9.1.0"

  name                    = "${var.product.name}-${each.key}"
  random_project_id       = true
  org_id                  = data.google_organization.org.org_id
  folder_id               = google_folder.child_nested_folder[each.key].id
  billing_account         = var.product.billing_account
  default_service_account = "delete"
  labels                  = var.product.labels
  ## Need to find out best way of injecting these api's and their format.
  activate_apis           = local.common_apis
}
