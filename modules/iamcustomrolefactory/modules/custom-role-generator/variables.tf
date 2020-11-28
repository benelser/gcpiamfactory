variable org_domain {
  type        = string
  description = "Organization domain name to create"
}

variable custom_role {
  type = object({
    role_id = string
    title = string
    description = string
    predefined_roles = list(string)
    additional_permissions = list(string)
    excluded_permissions = list(string)
  })
}