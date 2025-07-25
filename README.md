# MinIO Terraform modules

Terraform module which creates MinIO resources with better defaults

## Usage

### Single Bucket

```hcl
module "my_bucket" {
  source = "terraform-minio-modules/modules/minio-bucket"
  
  name = "my-bucket"
  
  bucket_acl = "private"
  
  object_locking = false
  
  object_versioning = true
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "MyBucketPolicy"
        Effect = "Allow"
        Principal = "*"
        Action = [
          "s3:ListBucket",
          "s3:GetObject*",
          "s3:PutObject*",
          "s3:GetBucketLocation",
          "s3:GetEncryptionConfiguration"
        ],
        Resource = [
          "arn:aws:s3:::my-bucket",
          "arn:aws:s3:::my-bucket/*"
        ]
      }
    ]
  }) 
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```