output "apply_pipeline_name" {
  description = "terraform-apply パイプライン名"
  value       = aws_codepipeline.terraform_apply.name
}

output "plan_pipeline_name" {
  description = "terraform-plan パイプライン名"
  value       = aws_codepipeline.terraform_plan.name
}

output "artifacts_bucket_name" {
  description = "共通アーティファクト S3 バケット名"
  value       = aws_s3_bucket.pipeline_artifacts.bucket
}

output "notification_rule_arn" {
  description = "apply パイプライン通知ルール ARN"
  value       = aws_codestarnotifications_notification_rule.apply_pipeline.arn
}
