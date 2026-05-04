output "plan_project_name" {
  description = "CodeBuild plan プロジェクト名"
  value       = aws_codebuild_project.terraform_plan.name
}

output "plan_project_arn" {
  description = "CodeBuild plan プロジェクト ARN"
  value       = aws_codebuild_project.terraform_plan.arn
}

output "apply_project_name" {
  description = "CodeBuild apply プロジェクト名"
  value       = aws_codebuild_project.terraform_apply.name
}

output "apply_project_arn" {
  description = "CodeBuild apply プロジェクト ARN"
  value       = aws_codebuild_project.terraform_apply.arn
}

output "destroy_project_name" {
  description = "CodeBuild destroy プロジェクト名"
  value       = aws_codebuild_project.terraform_destroy.name
}

output "destroy_project_arn" {
  description = "CodeBuild destroy プロジェクト ARN"
  value       = aws_codebuild_project.terraform_destroy.arn
}

output "role_arn" {
  description = "CodeBuild サービスロール ARN"
  value       = data.aws_iam_role.codebuild.arn
}
