provider "google" {

}

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