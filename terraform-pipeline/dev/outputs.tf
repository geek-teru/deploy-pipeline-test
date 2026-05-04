output "codebuild_plan_project_name" {
  description = "CodeBuild plan プロジェクト名"
  value       = module.codebuild.plan_project_name
}

output "codebuild_apply_project_name" {
  description = "CodeBuild apply プロジェクト名"
  value       = module.codebuild.apply_project_name
}

output "codebuild_destroy_project_name" {
  description = "CodeBuild destroy プロジェクト名"
  value       = module.codebuild.destroy_project_name
}

output "codebuild_role_arn" {
  description = "CodeBuild サービスロール ARN"
  value       = module.codebuild.role_arn
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

output "github_connection_arn" {
  description = "GitHub CodeStar Connection ARN"
  value       = local.github_connection_arn
}

output "notification_rule_arn" {
  description = "承認通知ルール ARN"
  value       = module.codepipeline.notification_rule_arn
}
