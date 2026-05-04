output "plan_project_name" {
  value = aws_codebuild_project.terraform_plan.name
}

output "plan_project_arn" {
  value = aws_codebuild_project.terraform_plan.arn
}

output "apply_project_name" {
  value = aws_codebuild_project.terraform_apply.name
}

output "apply_project_arn" {
  value = aws_codebuild_project.terraform_apply.arn
}
