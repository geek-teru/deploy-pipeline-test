output "codebuild_plan_project_name" {
  description = "CodeBuild plan プロジェクト名"
  value       = aws_codebuild_project.terraform_plan.name
}

output "codebuild_apply_project_name" {
  description = "CodeBuild apply プロジェクト名"
  value       = aws_codebuild_project.terraform_apply.name
}

output "codebuild_destroy_project_name" {
  description = "CodeBuild destroy プロジェクト名"
  value       = aws_codebuild_project.terraform_destroy.name
}

output "codepipeline_name" {
  description = "CodePipeline 名"
  value       = aws_codepipeline.terraform.name
}

output "pipeline_artifacts_bucket" {
  description = "パイプラインアーティファクト S3 バケット名"
  value       = aws_s3_bucket.pipeline_artifacts.bucket
}

output "notification_rule_arn" {
  description = "承認通知ルール ARN"
  value       = aws_codestarnotifications_notification_rule.pipeline_approval.arn
}
