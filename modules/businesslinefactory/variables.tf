variable "business_line_object" {
    type = object({
        name = string,
        enviornments = list(string),
        products = list(string),
        projects = list(string)
    })
}