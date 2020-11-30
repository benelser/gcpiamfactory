# Passing output from nested modules back up to main
output "product" {
  value = {
    product = var.business_unit.name
    root_folder = module.rootfolderfactory.root_folder
    components = module.nestedprojectfactory
  }
}

# module.nestedprojectfactory[0].google_folder.child_folder
# module.nestedprojectfactory[0].google_folder.child_nested_folder["dev"] 