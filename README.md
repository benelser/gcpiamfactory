# iamfactory
This code makes the assumption you have already deployed a folder structure and after the fact want to map IAM roles to that structure. 

## Data model
Creating custom object makes passing values through modules easier instead of having to write complex object deconstruction code this code passes the static object in its deconstructed form to modules to leverage the module ability to execute for_each on object. You can see the pattern as each modules calls another nested module deconstucting the object within scope.
```
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
```

## Resource Hierarchy
![Resource Hierarchy](./content/resource_hierarchy.png)