output "s3_bucket_name" {
  description = "S3バケット名"
  value       = aws_s3_bucket.app.bucket
}

output "s3_bucket_arn" {
  description = "S3バケットARN"
  value       = aws_s3_bucket.app.arn
}
