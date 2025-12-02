###Policy soc-to-securityhub-3082
resource "aws_iam_policy" "soc-to-securityhub-3082" {
  name        = "soc-to-securityhub-3082"
  path        = "/"
  description = "Policy access to Security Hub"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
                "sb:GET"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}