variable "project" {
  description = "プロジェクト名"
  type        = string
}

variable "github_repository_url" {
  description = "GitHubリポジトリURL"
  type        = string
}

variable "codebuild_role_name" {
  description = "CodeBuild サービスロール名（既存）"
  type        = string
}

variable "environment" {
  description = "環境名 (dev / stg / prd)"
  type        = string
}

variable "tf_version" {
  description = "使用するTerraformのバージョン"
  type        = string
}

variable "tf_working_dir" {
  description = "Terraformの作業ディレクトリ（リポジトリルートからの相対パス）"
  type        = string
}
