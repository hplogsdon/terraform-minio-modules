variable "name" {
  type        = string
  description = "Name of the bucket to be created"
}

variable "bucket_acl" {
  type = string
}

variable "object_locking" {
  type    = bool
  default = false
}

variable "object_versioning" {
  type    = bool
  default = false
}

variable "policy" {
  type = string
}

variable "tags" {
  description = "A map of additional tags to add to the bucket and resources"
  type        = map(string)
  default     = {}
}
