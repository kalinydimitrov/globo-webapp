locals {
  host_list_ssm_name = "/${local.name_prefix}/host_list"
  site_name_ssm_name = "/${local.name_prefix}/site_name"
}

resource "aws_ssm_parameter" "host_list" {
  name  = local.host_list_ssm_name
  type  = "String"
  value = join(",", aws_instance.main.*.private_dns)

  tags = local.common_tags

}

resource "aws_ssm_parameter" "site_name" {
  name  = local.site_name_ssm_name
  type  = "String"
  value = "${local.name_prefix}-taco-wagon"

  tags = local.common_tags

}

data "aws_iam_policy_document" "ssm_access" {
  statement {
    effect    = "Allow"
    actions   = ["ssm:GetParameter"]
    resources = [aws_ssm_parameter.host_list.arn, aws_ssm_parameter.site_name.arn]
  }

}

resource "aws_iam_policy" "ssm_access" {
  name   = "${local.name_prefix}-ssm-access"
  policy = data.aws_iam_policy_document.ssm_access.json

}

# resource "aws_iam_policy_attachment" "ssm_access" {
#   name       = aws_iam_policy.ssm_access.name
#   roles      = [var.ec2_role_name] # list of roles to attach the policy to
#   policy_arn = aws_iam_policy.ssm_access.arn

# }

# the new attachment – stable and without "empty result"
resource "aws_iam_role_policy_attachment" "ssm_access" {
  role       = var.ec2_role_name
  policy_arn = aws_iam_policy.ssm_access.arn

}