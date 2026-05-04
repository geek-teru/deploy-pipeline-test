terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "terraform-775538353788"
    key     = "deploy-pipeline/terraform-pipeline/dev/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

locals {
  github_connection_arn = "arn:aws:codeconnections:ap-northeast-1:775538353788:connection/049c37a9-d71e-4688-88b5-861767aba7d1"
  chatbot_arn           = "arn:aws:chatbot::775538353788:chat-configuration/slack-channel/testworkspace"
}

module "codebuild" {
  source = "../modules/codebuild"

  project               = var.project
  environment           = var.environment
  github_repository_url = var.github_repository_url
  codebuild_role_name   = "deploy-pipeline-test-role"
}

module "codepipeline" {
  source = "../modules/codepipeline"

  project                      = var.project
  environment                  = var.environment
  github_repository_id         = var.github_repository_id
  github_branch                = var.github_branch
  github_connection_arn        = local.github_connection_arn
  chatbot_arn                  = local.chatbot_arn
  codebuild_plan_project_name  = module.codebuild.plan_project_name
  codebuild_plan_project_arn   = module.codebuild.plan_project_arn
  codebuild_apply_project_name = module.codebuild.apply_project_name
  codebuild_apply_project_arn  = module.codebuild.apply_project_arn
  trigger_file_paths           = var.trigger_file_paths
}

