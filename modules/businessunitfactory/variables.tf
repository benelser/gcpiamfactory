variable name {
  type        = string
  description = "Business line name (root/top level folder) "
}

variable org_domain {
  type        = string
  description = "Organization domain name"
}

variable enviornments {
  type        = list(string)
  default = ["dev", "qa", "prod", "rnd"] 
  description = "Business line individual enviornments"
}

variable products {
  type        = list(string)
  description = "Business line individual products (child folders to name)"
}