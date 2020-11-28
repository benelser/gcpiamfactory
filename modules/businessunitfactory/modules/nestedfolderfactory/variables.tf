variable org_domain {
  type        = string
  description = "Organization domain name"
}

variable parent {
  type        = string
  description = "name of parent directory"
}

variable name {
  type        = string
  description = "name of the top folder"
}

variable childfoldername {
  type        = list(string)
  description = "list of child folders to create"
}

variable product {
  type = object({
    name  = string
    enviornments = list(string)
    labels = object({})
    activate_apis = list(string)
    billing_account = string
    delete_default_service_account = bool
  })
  description = "Product specific configurations that translate to project level configurations"
}