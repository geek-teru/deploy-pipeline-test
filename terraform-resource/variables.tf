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
