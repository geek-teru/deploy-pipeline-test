data "aws_caller_identity" "current" {}

# 共通アーティファクト S3 バケット
resource "aws_s3_bucket" "pipeline_artifacts" {
  bucket        = "${var.environment}-${var.project}-pipeline-artifacts-${data.aws_caller_identity.current.account_id}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "pipeline_artifacts" {
  bucket = aws_s3_bucket.pipeline_artifacts.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
