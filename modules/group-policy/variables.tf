variable "name" {
  type        = string
  description = "Name of the OIDC group"
}

variable "readonly" {
  type        = list(string)
  description = "List of buckets the group should have read permissions on"
  default     = []
}

variable "readwrite" {
  type        = list(string)
  description = "List of buckets the group should have read & write permissions on"
  default     = []
}

variable "additional_policies" {
  type = list(object({
    sid       = string
    effect    = string
    resources = list(string)
    actions   = list(string)
  }))
  description = "Custom policy statements for the group"
  default     = []
}