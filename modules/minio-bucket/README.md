# minio-bucket

Creates a MinIO bucket.

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
| [minio_s3_bucket.this](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/s3_bucket) | resource |
| [minio_s3_bucket_policy.this](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/s3_bucket_policy) | resource |
| [minio_s3_bucket_versioning.this](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | n/a | `string` | `"private"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the bucket to be created | `string` | n/a | yes |
| <a name="input_object_locking"></a> [object\_locking](#input\_object\_locking) | Enable object locking for the bucket (default: false).<br/>This must be enabled for replication. | `bool` | `false` | no |
| <a name="input_object_versioning"></a> [object\_versioning](#input\_object\_versioning) | Enable global object versioning on the entire bucket (default: false).<br/>For more complex versioning requirements, use `minio_s3_bucket_versioning` directly. | `bool` | `false` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | Policy JSON document to apply to the bucket. Can be a HERE-DOC object, or a `minio_iam_policy_document` data source | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of additional tags to add to the bucket and resources. Unused, unfortunately | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the created bucket |
<!-- END_TF_DOCS -->