variable org_domain {
  type        = string
  description = "Organization domain name"
}

variable business_unit {
  type = object({
    name = string
    products = list(object({
      name  = string
      enviornments = list(string)
      labels = object({})
      activate_apis = list(string)
      billing_account = string
      delete_default_service_account = bool
    }))
  })
}