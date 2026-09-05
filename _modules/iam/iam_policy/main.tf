data "aws_iam_policy_document" "main" {

  statement {
    actions   = ["s3:*"]
    resources = ["*"]
  }

}


resource "aws_iam_user_policy" "main" {

  name   = "${var.name_prefix}-${var.iam_policy_name}-iam-usr-policy"
  user   = var.iam_user_name
  policy = data.aws_iam_policy_document.main.json

}