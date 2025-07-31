module "my_bucket" {
  source = "../../modules/minio-bucket"

  # Name of the bucket to create
  name = "my-bucket"

  # The ACL to apply to the bucket
  bucket_acl = "private"

  # Whether Object Locking is enabled.
  object_locking = true

  # Whether Object Versioning is enabled.
  object_versioning = true

  # The policy to apply to the bucket.
  policy = data.minio_iam_policy_document.authenticated_read_policy.json

  tags = {
    Terraform = true
  }
}

data "minio_iam_policy_document" "authenticated_read_policy" {
  statement {
    sid    = "AuthenticatedReadBucketPolicy"
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation",
    ]
    principal = "*"
    resources = [
      "arn:aws:s3:::my-bucket"
    ]
  }
  statement {
    sid    = "AuthenticatedReadObjectPolicy"
    effect = "Allow"
    actions = [
      "s3:GetObject"
    ]
    principal = "*"
    resources = [
      "arn:aws:s3:::my-bucket/*"
    ]
  }
}

module "admin_group" {
  source = "../../modules/group-policy"

  # OIDC Group Name
  name = "ITAdmin"

  # List of buckets the group should have read permissions on
  readonly = ["*"]

  # List of buckets the group should have write permissions on
  readwrite = ["my-bucket"]

  # Any custom policy statements for the group
  additional_policies = [
    {
      sid       = "ITAdmin-CustomPolicyObjects"
      effect    = "Allow"
      resources = ["arn:aws:s3:::*/*"]
      actions = [
        "s3:PutObject",
        "s3:PutObjectTagging",
        "s3:AbortMultipartUpload",
        "s3:ListMultipartUploadParts"
      ]
    }
  ]
}
