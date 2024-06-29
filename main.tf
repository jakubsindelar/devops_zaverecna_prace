
resource "aws_ecr_repository" "public_repository" {
  name                 = "my-public-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "public_policy" {
  repository = aws_ecr_repository.public_repository.name

  policy = jsonencode({
    Version = "2008-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability"
        ]
      }
    ]
  })
}

output "repository_url" {
  value = aws_ecr_repository.public_repository.repository_url
}
