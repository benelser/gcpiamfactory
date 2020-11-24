provider "google" {
    
}

###############################################################################
#                                Business units                               #
###############################################################################

locals {
  biz_products = ["supercoolproduct", "anothercoolsupportproduct", "andyetanother"]
  enviornments = ["dev", "qa", "prod", "rnd"] 
}

module "SuperSecretProject" {
    source = "./modules/businessunitfactory"
    org_domain = var.org_domain
    name = "SuperSecretProject"
    enviornments = local.enviornments
    products = local.biz_products
}

module "NotSoImportantProject" {
    source = "./modules/businessunitfactory"
    org_domain = var.org_domain
    name = "NotSoImportantProject"
    enviornments = local.enviornments
    products = local.biz_products
}

# These all will have attributes after apply
output "product-components" {
  value = module.SuperSecretProject.product.components
}

output "product-enviornments" {
  value = module.SuperSecretProject.product.components[0].enviornments
}

output "specific-product-component-enviornment" {
  value = module.SuperSecretProject.product.components[0].enviornments["dev"]
}