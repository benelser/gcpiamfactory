resource "google_folder" "child_folder" {
  parent = var.parent
  display_name = var.name
}

resource "google_folder" "child_nested_folder" {
  for_each = toset(var.childfoldername)
  parent = google_folder.child_folder.name
  display_name = each.key
}