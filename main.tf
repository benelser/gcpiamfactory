provider "google" {

}

## IAM Bindings Creation
locals {
  businessunit_iam_definitions = fileset("${path.module}/businessunits", "*")
}

module "bizunit" {
  for_each    = toset(local.businessunit_iam_definitions[*])
  # In production this source needs to reference a version of businessunitiamfactory source control URI
  source     = "./modules/businessunitiamfactory"
  org_domain = var.org_domain
  business_unit = jsondecode(file("${path.module}/businessunits/${each.key}"))
 
}