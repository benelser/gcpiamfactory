variable "business_line_object" {
    type = object({
        name = string,
        enviornments = list(string),
        products = list(string),
        projects = list(string)
    })
}

# variable name {
#     type = string
#     description = "Name of the business line"
# }

# variable enviornments {
#   type        = list
#   description = "The name of the GCP folders that make up each environment"
#   default     = ["dev", "qa", "prod", "rnd"]
# }

# variable business_line_products {
#     type = list(string)
#     description = "All child products of a business line"
# }

# variable business_line_projects {
#     type = list(string)
#     description = "Projects that belong to parent business line and product"
# }