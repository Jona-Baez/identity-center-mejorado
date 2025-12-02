###Policy developer-to-apigateway-3082
resource "aws_iam_policy" "developer-to-apigateway-3082" {
  name        = "developer-to-apigateway-3082"
  path        = "/"
  description = "Policy access to API Gateway"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
                "apigateway:GET"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}