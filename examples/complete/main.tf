module "my_bucket" {
  source = "../../modules/minio-bucket"

  name           = "my-bucket"
  object_locking = true
}