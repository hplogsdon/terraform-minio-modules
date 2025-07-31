output "group_id" {
  value = minio_iam_group.this.id
}

output "policy_id" {
  value = minio_iam_group_policy.this.id
}