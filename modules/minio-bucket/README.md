# minio-bucket

Creates MinIO bucket.

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
| [minio_s3_bucket.s3_bucket](https://registry.terraform.io/providers/aminueza/minio/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the bucket to be created | `string` | n/a | yes |
| <a name="input_object_locking"></a> [object\_locking](#input\_object\_locking) | n/a | `bool` | `false` | no |
| <a name="input_object_versioning"></a> [object\_versioning](#input\_object\_versioning) | n/a | `bool` | `false` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of additional tags to add to the bucket and resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the created bucket |
<!-- END_TF_DOCS -->