provider "google" {

}

# terraform {
#   required_version = ">=0.13.4"
#   #backend "gcs" {
#   #  prefix = "<PROD_PROJECT_ID>foundations/"
#   #  bucket = "<PROD_PROJECT_ID>-tfstate"
#   #}
# }

# ## Establish GCS backend
# resource "google_storage_bucket" "tfstate" {
#   name                        = "${var.project_name}-iam-tfstate"
#   project                     = var.project_id
#   uniform_bucket_level_access = true
#   force_destroy               = true
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "google_service_account" "terraform" {
#   account_id   = "terraform-sa-${each.key}"
#   display_name = "Service account for Terraform in ${each.key} environment"
#   project      = var.project_id
# }

# resource "google_service_account_key" "terraform" {
#   service_account_id = google_service_account.terraform[each.key].name
#   public_key_type    = "TYPE_X509_PEM_FILE"
# }

# # Terraform Service Account Roles ###
# resource "google_project_iam_member" "terraform" {
#   for_each = toset(var.folders)
#   role     = "roles/owner"
#   member   = "serviceAccount:${google_service_account.terraform[each.key].email}"
#   project  = google_project.main[each.key].project_id
# }



## IAM Bindings Creation
locals {
  businessunit_iam_definitions = fileset("${path.module}/businessunits", "*")
}

module "bizunits" {
  for_each    = toset(local.businessunit_iam_definitions[*])
  source     = "./modules/businessunitiamfactory"
  org_domain = var.org_domain
  business_unit = jsondecode(file("${path.module}/businessunits/${each.key}"))
 
}