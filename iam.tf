resource "aws_iam_user" "ci_cd_user" {
  provider = aws.iam
  name     = "ci-cd"
}

resource "aws_iam_access_key" "ci_cd_access_key" {
  provider = aws.iam
  user     = aws_iam_user.ci_cd_user.name
}

resource "aws_iam_user_policy" "ecr_policy" {
  provider = aws.iam
  name     = "ecr-policy"
  user     = aws_iam_user.ci_cd_user.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ecr:*",
          "ecs:*",
          "logs:*"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

output "access_key_id" {
  value = aws_iam_access_key.ci_cd_access_key.id
}

output "secret_access_key" {
  value     = aws_iam_access_key.ci_cd_access_key.secret
  sensitive = true
}
