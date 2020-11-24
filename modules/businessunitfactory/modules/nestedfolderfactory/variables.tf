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