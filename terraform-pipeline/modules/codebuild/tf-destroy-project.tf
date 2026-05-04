resource "aws_codebuild_project" "terraform_destroy" {
  name          = "${var.environment}-${var.project}-terraform-destroy"
  description   = "Terraform destroy"
  service_role  = data.aws_iam_role.codebuild.arn
  build_timeout = 60

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

  }

  source {
    type            = "GITHUB"
    location        = var.github_repository_url
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = false
    }

    buildspec = templatefile("${path.module}/buildspec_destroy.yml", {
      tf_version     = var.tf_version
      tf_working_dir = var.tf_working_dir
      env            = var.environment
    })
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/aws/codebuild/${var.environment}-${var.project}-terraform-destroy"
      stream_name = "build-log"
      status      = "ENABLED"
    }
  }

  tags = {
    Name = "${var.environment}-${var.project}-terraform-destroy"
  }
}
