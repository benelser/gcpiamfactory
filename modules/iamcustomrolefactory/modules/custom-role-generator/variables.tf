variable "org_id" {
  type        = string
  description = "Organization to create custom role"
}

variable "custom_role" {
  type = object({
    role_id = string
    title = string
    description = string
    predefined_roles = list(string)
    additional_permissions = list(string)
    excluded_permissions = list(string)
  })
}