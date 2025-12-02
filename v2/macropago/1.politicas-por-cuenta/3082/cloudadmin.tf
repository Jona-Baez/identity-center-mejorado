###Policy cloudadmin
resource "aws_iam_policy" "cloudadmin" {
  name        = "cloudadmin"
  path        = "/"
  description = "Policy access to CloudAdmin"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
                "*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}