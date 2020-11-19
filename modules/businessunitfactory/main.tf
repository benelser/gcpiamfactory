module rootfolderfactory {
    source = "../rootfolderfactory"
    org_domain = var.org_domain
    name = var.name
}

module nestedfolderfactory {
    count = length(var.products)
    name = var.products[count.index]
    childfoldername = var.enviornments
    source = "../nestedfolderfactory"
    org_domain = var.org_domain
    parent = module.rootfolderfactory.root_folder.name
}