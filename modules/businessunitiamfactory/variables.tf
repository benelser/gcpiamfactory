variable org_domain {
  type        = string
  description = "Organization domain name"
}

variable business_unit {
  type = object({
    name = string
    folder_id = number
    bizunit_level1_iam_bindings = list(object({
        role = string
        members = list(string)
    }))
    components = list(object({
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
    }))
  })
}