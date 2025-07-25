
resource "minio_s3_bucket" "s3_bucket" {
  bucket = var.name
}