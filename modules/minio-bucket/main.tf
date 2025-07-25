
resource "minio_s3_bucket" "this" {
  bucket = var.name
  object_locking = var.object_locking
}

resource "minio_s3_bucket_versioning" "this" {
  bucket = minio_s3_bucket.this.id
  count = var.object_versioning ? 1 : 0

  versioning_configuration {
    status = "Enabled"
  }
}