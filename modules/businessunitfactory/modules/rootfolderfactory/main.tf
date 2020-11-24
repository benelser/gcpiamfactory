resource "google_folder" "root_folder" {
  parent       = "organizations/${data.google_organization.org.org_id}"
  display_name = var.name
}