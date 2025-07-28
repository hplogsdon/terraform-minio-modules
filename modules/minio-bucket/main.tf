
resource "minio_s3_bucket" "this" {
  bucket         = var.name
  object_locking = var.object_locking
  acl            = var.bucket_acl
}

resource "minio_s3_bucket_versioning" "this" {
  bucket = minio_s3_bucket.this.id
  count  = var.object_versioning ? 1 : 0

  versioning_configuration {
    status = "Enabled"
  }
}

resource "minio_s3_bucket_policy" "this" {
  count  = var.policy != "" ? 1 : 0
  bucket = minio_s3_bucket.this.id
  policy = var.policy
}
