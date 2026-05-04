output "codebuild_plan_project_name" {
  description = "CodeBuild plan プロジェクト名"
  value       = module.codebuild.plan_project_name
}

output "codebuild_apply_project_name" {
  description = "CodeBuild apply プロジェクト名"
  value       = module.codebuild.apply_project_name
}

output "apply_pipeline_name" {
  description = "terraform-apply パイプライン名"
  value       = module.codepipeline.apply_pipeline_name
}

output "plan_pipeline_name" {
  description = "terraform-plan パイプライン名"
  value       = module.codepipeline.plan_pipeline_name
}

output "pipeline_artifacts_bucket" {
  description = "共通アーティファクト S3 バケット名"
  value       = module.codepipeline.artifacts_bucket_name
}

output "notification_rule_arn" {
  description = "承認通知ルール ARN"
  value       = module.codepipeline.notification_rule_arn
}
