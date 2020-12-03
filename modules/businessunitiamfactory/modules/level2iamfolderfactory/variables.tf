variable org_domain {
  type        = string
  description = "Organization domain name"
}

variable component {
    type = object({
      name = string
      folder_id = number
      component_level2_iam_bindings = list(object({
        role = string
        members = list(string)
      }))
      environment_level3_iam_bindings = list(object({
        name = string
        folder_id = number
        iam_bindings = list(object({
          role = string
          members = list(string)
        }))
      }))
    })
}