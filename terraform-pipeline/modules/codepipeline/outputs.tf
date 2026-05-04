output "apply_pipeline_name" {
  description = "terraform-apply パイプライン名"
  value       = aws_codepipeline.terraform_apply.name
}

output "apply_pipeline_arn" {
  description = "terraform-apply パイプライン ARN"
  value       = aws_codepipeline.terraform_apply.arn
}

output "plan_pipeline_name" {
  description = "terraform-plan パイプライン名"
  value       = aws_codepipeline.terraform_plan.name
}

output "plan_pipeline_arn" {
  description = "terraform-plan パイプライン ARN"
  value       = aws_codepipeline.terraform_plan.arn
}

output "artifacts_bucket_name" {
  description = "共通アーティファクト S3 バケット名"
  value       = aws_s3_bucket.pipeline_artifacts.bucket
}

output "notification_rule_arn" {
  description = "承認通知ルール ARN"
  value       = aws_codestarnotifications_notification_rule.pipeline_approval.arn
}

output "codepipeline_role_arn" {
  description = "共通 CodePipeline サービスロール ARN"
  value       = aws_iam_role.codepipeline.arn
}
