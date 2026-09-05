# -------------- AWS IAM User --------------

resource "aws_iam_user" "main" {
  name = "${var.name_prefix}-${var.iam_user_name}-iam-usr"
  path = var.path
}   