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

output "codebuild_role_arn" {
  description = "CodeBuild サービスロール ARN"
  value       = data.aws_iam_role.codebuild.arn
}

output "codepipeline_name" {
  description = "CodePipeline 名"
  value       = aws_codepipeline.terraform.name
}

output "pipeline_artifacts_bucket" {
  description = "パイプラインアーティファクト S3 バケット名"
  value       = aws_s3_bucket.pipeline_artifacts.bucket
}

output "github_connection_arn" {
  description = "GitHub CodeStar Connection ARN"
  value       = data.aws_codestarconnections_connection.github.arn
}

output "approval_sns_topic_arn" {
  description = "承認通知 SNS トピック ARN"
  value       = aws_sns_topic.pipeline_approval.arn
}
