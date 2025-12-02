###Policy soc-to-cloudtrail-3082
resource "aws_iam_policy" "soc-to-cloudtrail-3082" {
  name        = "soc-to-cloudtrail-3082"
  path        = "/"
  description = "Policy access to Cloudtrail"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
                "cloudtrail:GET"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}