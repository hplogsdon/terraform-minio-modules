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
    sid     = "AuthenticatedReadBucketPolicy"
    effect  = "Allow"
    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
    ]
    principal = "*"
    resources = [
      "arn:aws:s3:::my-bucket"
    ]
  }
  statement {
    sid     = "AuthenticatedReadObjectPolicy"
    effect  = "Allow"
    actions = [
      "s3:GetObject"
    ]
    principal = "*"
    resources = [
      "arn:aws:s3:::my-bucket/*"
    ]
  }
}