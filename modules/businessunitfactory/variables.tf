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
      labels = map(string)
      activate_apis = list(string)
      billing_account = string
      default_service_account = string
      iam_bindings = list(object({
        enviornment = string
        role = string
        members = list(string)
      }))
    }))
  })
}