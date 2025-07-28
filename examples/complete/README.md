# Complete MinIO example

Configuration in this directory creates MinIO resources with different sets of arguments.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which can cost money. Run `terraform destroy` when you don't need these resources.

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_my_bucket"></a> [my\_bucket](#module\_my\_bucket) | ../../modules/minio-bucket | n/a |

## Resources

| Name | Type |
|------|------|
| [minio_iam_policy_document.authenticated_read_policy](https://registry.terraform.io/providers/aminueza/minio/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_minio_password"></a> [minio\_password](#input\_minio\_password) | n/a | `string` | `"minio-admin"` | no |
| <a name="input_minio_server"></a> [minio\_server](#input\_minio\_server) | n/a | `string` | `"localhost:9000"` | no |
| <a name="input_minio_user"></a> [minio\_user](#input\_minio\_user) | n/a | `string` | `"minio-admin"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->