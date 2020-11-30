module "rootfolderfactory" {
    source = "./modules/rootfolderfactory"
    org_domain = var.org_domain
    name = var.business_unit.name
}

module "nestedprojectfactory" {
    count = length(var.business_unit.products)
    name = var.business_unit.products[count.index].name
    childfoldername = var.business_unit.products[count.index].enviornments
    source = "./modules/nestedprojectfactory"
    org_domain = var.org_domain
    parent = module.rootfolderfactory.root_folder.name
    product = var.business_unit.products[count.index]
}