resource "aws_ecr_repository" "ecr" {
  name = "test-repo"
  image_scanning_configuration {
    scan_on_push = true
  }
  image_tag_mutability = "IMMUTABLE"
}

