provider "google" {

}

###############################################################################
#                                Custom Roles                                 #
###############################################################################

module "custom_role" {
  source      = "./modules/iamcustomrolefactory"
  org_domain      = var.org_domain
  path_to_custom_roles = "${path.root}/iamcustomroles"
}


###############################################################################
#                                Business units                               #
###############################################################################

# module "bizunit1" {
#   source     = "./modules/businessunitfactory"
#   org_domain = var.org_domain
#   business_unit = {
#     name = "buzunit1",
#     products = [
#       jsondecode(file("${path.module}/businessunits/bizunit1/products/product1.json"))
#       #jsondecode(file("${path.module}/businessunits/bizunit1/products/product2.json"))
#     ]
#   }
# }

# module "bizunit2" {
#   source     = "./modules/businessunitfactory"
#   org_domain = var.org_domain
#   business_unit = {
#     name = "bizunit2",
#     products = [
#       jsondecode(file("${path.module}/businessunits/bizunit2/products/product1.json")),
#       jsondecode(file("${path.module}/businessunits/bizunit2/products/product2.json"))
#     ]
#   }
# }