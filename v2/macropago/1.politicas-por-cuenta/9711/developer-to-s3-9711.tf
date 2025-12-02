###Policy developer-to-s3-9711
resource "aws_iam_policy" "developer-to-s3-9711" {
  name        = "developer-to-s3-9711"
  path        = "/"
  description = "Policy access to S3"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
                "s3:ListAllMyBuckets"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
                "s3:PutObject",
                "s3:DescribeObject",
                "s3:GetObject",
                "s3:ListObject",
        ]
        Effect   = "Allow"
        Resource = [
                "arn:aws:s3:::mibucket",
                "arn:aws:s3:::mibucket/*"
        ]
      },
      {
        Action = [
                "s3:DeleteObject"
        ]
        Effect   = "Allow"
        Resource = [
                
                "arn:aws:s3:::mibucket/mipaht/*"
        ]
      },
    ]
  })
}