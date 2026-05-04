variable "aws_region" {
  description = "AWSリージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "project" {
  description = "プロジェクト名"
  type        = string
  default     = "deploy"
}

variable "environment" {
  description = "環境名 (dev / stg / prd)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "stg", "prd"], var.environment)
    error_message = "environment は dev, stg, prd のいずれかを指定してください。"
  }
}

variable "github_repository_url" {
  description = "GitHubリポジトリURL"
  type        = string
  default     = "https://github.com/geek-teru/deploy-pipeline-test"
}

variable "github_repository_id" {
  description = "GitHubリポジトリID (owner/repo形式)"
  type        = string
  default     = "geek-teru/deploy-pipeline-test"
}

variable "github_branch" {
  description = "トリガーするGitHubブランチ名"
  type        = string
  default     = "main"
}

variable "trigger_file_path" {
  description = "パイプラインをトリガーするファイルパスパターン (空の場合は全変更でトリガー)"
  type        = string
  default     = "terraform-resource/**"
}
