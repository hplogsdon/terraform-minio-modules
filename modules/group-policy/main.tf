data "minio_iam_policy_document" "this" {
  statement {
    sid    = "${var.name}-ReadAccessPolicy"
    effect = "Allow"
    resources = flatten([
      for bucket in concat(var.readonly, var.readwrite) : [
        "arn:aws:s3:::${bucket}",
        "arn:aws:s3:::${bucket}/*"
      ]
    ])
    actions = [
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket"
    ]
  }

  statement {
    sid    = "${var.name}-ReadWritePolicy"
    effect = "Allow"
    resources = flatten([
      for bucket in var.readwrite : [
        "arn:aws:s3:::${bucket}",
        "arn:aws:s3:::${bucket}/*"
      ]
    ])
    actions = [
      "s3:PutObject*",
      "s3:DeleteObject*",
    ]
  }

  dynamic "statement" {
    for_each = [for policy in var.additional_policies : policy if length(policy.actions) > 0 && length(policy.resources) > 0]
    content {
      sid       = statement.value.sid
      effect    = statement.value.effect
      resources = statement.value.resources
      actions   = statement.value.actions
    }
  }
}

resource "minio_iam_group" "this" {
  name = var.name
}

resource "minio_iam_group_policy" "this" {
  name_prefix = "${var.name}-"
  group       = minio_iam_group.this.id
  policy      = data.minio_iam_policy_document.this.json
}

resource "minio_iam_group_policy_attachment" "this" {
  group_name  = minio_iam_group.this.name
  policy_name = minio_iam_group_policy.this.name
}