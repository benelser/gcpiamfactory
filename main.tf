provider "google" {
    
}

locals {
  biz_lines = [for i in range(1,5): format("BusinessLine%d", i)]
}

module businesslinefactory {
    for_each = toset(local.biz_lines)
    source = "./modules/businesslinefactory"
    business_line_object = {
        name = each.key
        enviornments = ["dev", "qa", "prod", "rnd"] 
        products = [for i in range(1,5): format("BusinessLine-Product%d", i)]
        projects = [for i in range(1,5): format("BusinessLine-Projects%d", i)]
    }
}

output "module_output_name" {
  value = module.businesslinefactory["BusinessLine1"].business_line_object.name
}

output "module_output_env" {
  value = module.businesslinefactory["BusinessLine1"].business_line_object.enviornments
}

output "module_output_products" {
  value = module.businesslinefactory["BusinessLine1"].business_line_object.products
}

output "module_output_projects" {
  value = module.businesslinefactory["BusinessLine1"].business_line_object.projects
}