# group-policy

Creates a MinIO group backed by OIDC with some attached policies.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_minio"></a> [minio](#requirement\_minio) | >= 3.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_minio"></a> [minio](#provider\_minio) | >= 3.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [minio_iam_group.this](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/iam_group) | resource |
| [minio_iam_group_policy.this](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/iam_group_policy) | resource |
| [minio_iam_group_policy_attachment.this](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/iam_group_policy_attachment) | resource |
| [minio_iam_policy_document.this](https://registry.terraform.io/providers/aminueza/minio/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_policies"></a> [additional\_policies](#input\_additional\_policies) | Custom policy statements for the group | <pre>list(object({<br/>    sid       = string<br/>    effect    = string<br/>    resources = list(string)<br/>    actions   = list(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the OIDC group | `string` | n/a | yes |
| <a name="input_readonly"></a> [readonly](#input\_readonly) | List of buckets the group should have read permissions on | `list(string)` | `[]` | no |
| <a name="input_readwrite"></a> [readwrite](#input\_readwrite) | List of buckets the group should have read & write permissions on | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_id"></a> [group\_id](#output\_group\_id) | n/a |
| <a name="output_policy_id"></a> [policy\_id](#output\_policy\_id) | n/a |
<!-- END_TF_DOCS -->