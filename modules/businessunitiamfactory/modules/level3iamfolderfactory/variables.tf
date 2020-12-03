variable org_domain {
  type        = string
  description = "Organization domain name"
}

variable environment_level3_iam_binding {
  type = object({
      name = string
      folder_id = number
      iam_bindings = list(object({
        role = string
        members = list(string)
    }))
  })
}