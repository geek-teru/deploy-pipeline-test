variable "project" {
  description = "プロジェクト名"
  type        = string
}

variable "environment" {
  description = "環境名 (dev / stg / prd)"
  type        = string
}

variable "github_repository_id" {
  description = "GitHubリポジトリID (owner/repo形式)"
  type        = string
}

variable "github_branch" {
  description = "push トリガーのブランチ名 / PR のターゲットブランチ名"
  type        = string
  default     = "main"
}

variable "trigger_file_path" {
  description = "パイプラインをトリガーするファイルパスパターン (空の場合は全変更でトリガー)"
  type        = string
  default     = ""
}

variable "github_connection_arn" {
  description = "GitHub CodeStar Connection ARN"
  type        = string
}

variable "chatbot_arn" {
  description = "AWS Chatbot (Slack) ARN"
  type        = string
}

variable "codebuild_plan_project_name" {
  description = "CodeBuild plan プロジェクト名"
  type        = string
}

variable "codebuild_plan_project_arn" {
  description = "CodeBuild plan プロジェクト ARN"
  type        = string
}

variable "codebuild_apply_project_name" {
  description = "CodeBuild apply プロジェクト名"
  type        = string
}

variable "codebuild_apply_project_arn" {
  description = "CodeBuild apply プロジェクト ARN"
  type        = string
}


