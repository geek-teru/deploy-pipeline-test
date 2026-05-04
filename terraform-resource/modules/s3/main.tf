data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "app" {
  bucket        = "${var.environment}-${var.project}-${data.aws_caller_identity.current.account_id}"
  force_destroy = true
}

# パブリックアクセスのブロック
resource "aws_s3_bucket_public_access_block" "app" {
  bucket = aws_s3_bucket.app.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# バージョニング
resource "aws_s3_bucket_versioning" "app" {
  bucket = aws_s3_bucket.app.id

  versioning_configuration {
    status = "Enabled"
  }
}
