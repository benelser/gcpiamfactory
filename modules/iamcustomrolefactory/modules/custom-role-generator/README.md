# Google Cloud Custom IAM Role Generator

# Gotchas
[google_project_iam_custom_role resource doc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam_custom_role)
Warning:
Note that custom roles in GCP have the concept of a soft-delete. There are two issues that may arise from this and how roles are propagated. 1) creating a role may involve undeleting and then updating a role with the same name, possibly causing confusing behavior between undelete and update. 2) A deleted role is permanently deleted after 7 days, but it can take up to 30 more days (i.e. between 7 and 37 days after deletion) before the role name is made available again. This means a deleted role that has been deleted for more than 7 days cannot be changed at all by Terraform, and new roles cannot share that name.


Helper module to generate an organization-level [custom IAM role](https://cloud.google.com/iam/docs/creating-custom-roles) based on predefined role and permissions inputs.

Currently, to compose a custom role, you must manually select individual permissions. This module allows users create a custom role based on predefined roles, which are regularly maintained by Google product teams.

For this module to be most effective, you'll need to re-run this on a regular basis so that your custom role is kept up-to-date with the latest permissions from predefined roles.

## Compatibility
This module is meant for use with Terraform 0.13.

## Usage
```hcl
module "custom_role" {
  source      = "./custom-role-generator"
  org_id      = var.org_id
  role_id     = "Developer"
  title       = "Custom Developer Role"
  description = "Role for Developers"
  predefined_roles = [
    "roles/compute.instanceAdmin",
    "roles/bigquery.jobUser"
  ]
  additional_permissions = ["serviceusage.quotas.get"]
  excluded_permissions = ["compute.firewalls.create", "compute.firewalls.delete"]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| org\_id | Organization to create custom role | `string` | n/a | yes |
| role\_id | Identifier for custom role | `string` | n/a | yes |
| title | Human readable title for custom role | `string` | n/a | yes |
| description | Human readable dsecription for custom role | `string` | n/a | yes |
| predefined\_roles | List of predefined roles used to compose permissions, e.g. ["roles/bigquery.admin", "roles/pubsub.admin"] | `list` | n/a | yes |
| additional\_permissions | Additional permissions to include in custom role, e.g. ["storage.objects.getIamPolicy"] | `list` | `[]` | no |
| excluded\_permissions | Permissions to exclude from custom roles. WARNING: This may break functionality in unexpected ways | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | an identifier for the resource with the format `organizations/{{org_id}}/roles/{{role_id}}` |
| name | The name of the role in the format `organizations/{{org_id}}/roles/{{role_id}}`. Like `id`, this field can be used as a reference in other resources such as IAM role bindings. |
