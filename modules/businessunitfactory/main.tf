module "rootfolderfactory" {
    source = "./modules/rootfolderfactory"
    org_domain = var.org_domain
    name = var.business_unit.name
}

module "nestedfolderfactory" {
    count = length(var.business_unit.products)
    name = var.business_unit.products[count.index].name
    childfoldername = var.business_unit.products[count.index].enviornments
    source = "./modules/nestedfolderfactory"
    org_domain = var.org_domain
    parent = module.rootfolderfactory.root_folder.name
    product = var.business_unit.products[count.index]
}