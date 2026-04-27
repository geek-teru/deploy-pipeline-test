variable "aws_region" {
  description = "AWSリージョン"
  type        = string
  default     = "ap-northeast-1"
}

variable "project" {
  description = "プロジェクト名"
  type        = string
  default     = "deploy-pipeline"
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
}

variable "github_repository_id" {
  description = "GitHubリポジトリID (owner/repo形式)"
  type        = string
}

variable "github_branch" {
  description = "トリガーするGitHubブランチ名"
  type        = string
  default     = "main"
}

variable "approval_notification_email" {
  description = "承認通知の送信先メールアドレス"
  type        = string
}

variable "terraform_state_bucket" {
  description = "Terraform stateを保存するS3バケット名"
  type        = string
  default     = "terraform-775538353788"
}
