provider "google" {

}

################################################
#           Configure Backend Here             #
#                                              #
################################################


# Load up JSON
locals {
  bizunit_json = file("${path.module}/bizunit.json")
}

## Create some IAM Bindings
module "bizunit" {
  # In production this source needs to reference a version of businessunitiamfactory source control URI
  source     = "./modules/businessunitiamfactory"
  org_domain = var.org_domain
  business_unit = jsondecode(local.bizunit_json) # Serialize our json to terraform object
 
}