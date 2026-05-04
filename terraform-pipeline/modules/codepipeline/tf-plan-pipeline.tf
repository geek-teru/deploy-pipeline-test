# terraform-plan パイプライン: PR → Plan のみ
resource "aws_codepipeline" "terraform_plan" {
  name          = "${var.environment}-${var.project}-terraform-plan"
  role_arn      = aws_iam_role.codepipeline.arn
  pipeline_type = "V2"

  artifact_store {
    location = aws_s3_bucket.pipeline_artifacts.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.github_connection_arn
        FullRepositoryId = var.github_repository_id
        BranchName       = var.github_branch
        DetectChanges    = "false"
      }
    }
  }

  stage {
    name = "Plan"

    action {
      name            = "TerraformPlan"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      input_artifacts = ["source_output"]

      configuration = {
        ProjectName = var.codebuild_plan_project_name
      }
    }
  }

  trigger {
    provider_type = "CodeStarSourceConnection"
    git_configuration {
      source_action_name = "Source"
      pull_request {
        events = ["OPEN", "UPDATED"]
        branches {
          includes = [var.github_branch]
        }
        dynamic "file_paths" {
          for_each = var.trigger_file_path != "" ? [1] : []
          content {
            includes = [var.trigger_file_path]
          }
        }
      }
    }
  }
}

# 実行通知ルール
resource "aws_codestarnotifications_notification_rule" "plan_pipeline_execution" {
  name        = "${var.environment}-${var.project}-plan-pipeline-execution"
  resource    = aws_codepipeline.terraform_plan.arn
  detail_type = "FULL"

  event_type_ids = [
    "codepipeline-pipeline-pipeline-execution-started",
    "codepipeline-pipeline-pipeline-execution-succeeded",
    "codepipeline-pipeline-pipeline-execution-failed",
  ]

  target {
    type    = "AWSChatbotSlack"
    address = var.chatbot_arn
  }
}
