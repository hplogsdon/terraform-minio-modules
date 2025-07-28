variable "name" {
  type        = string
  description = "Name of the bucket to be created"
  validation {
    condition = len(var.name) > 2 && len(var.name) < 64
    error_message = "Name must be at least 3 characters and at most 63 characters long."
  }
}

variable "bucket_acl" {
  type    = string
  default = "private"
  validation {
    condition     = contains(["private", "private-read", "private-write", "private-read-write", "public"], var.bucket_acl)
    error_message = "Invalid input, options: \"private\", \"private-read\", \"private-write\", \"private-read-write\", \"public\"."
  }
}

variable "object_locking" {
  type        = bool
  default     = false
  description = "Enable object locking for the bucket (default: false).\nThis must be enabled for replication."
}

variable "object_versioning" {
  default     = false
  type        = bool
  description = "Enable global object versioning on the entire bucket (default: false).\nFor more complex versioning requirements, use `minio_s3_bucket_versioning` directly."
}

variable "policy" {
  type        = string
  default     = ""
  description = "Policy JSON document to apply to the bucket. Can be a HERE-DOC object, or a `minio_iam_policy_document` data source"
}

variable "tags" {
  description = "A map of additional tags to add to the bucket and resources"
  type        = map(string)
  default     = {}
}
