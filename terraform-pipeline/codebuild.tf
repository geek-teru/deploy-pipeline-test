locals {
  common_environment = [
    {
      name  = "TF_VERSION"
      value = "1.6.6"
    },
    {
      name  = "TF_WORKING_DIR"
      value = "terraform-resource"
    }
  ]
}

# Terraform plan 用 CodeBuild プロジェクト
resource "aws_codebuild_project" "terraform_plan" {
  name          = "${var.project}-terraform-plan"
  description   = "Terraform plan"
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

    dynamic "environment_variable" {
      for_each = local.common_environment
      content {
        name  = environment_variable.value.name
        value = environment_variable.value.value
      }
    }
  }

  source {
    type            = "GITHUB"
    location        = var.github_repository_url
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = false
    }

    buildspec = file("${path.module}/buildspec_plan.yml")
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/aws/codebuild/${var.project}-terraform-plan"
      stream_name = "build-log"
      status      = "ENABLED"
    }
  }

  tags = {
    Name = "${var.project}-terraform-plan"
  }
}

# Terraform apply 用 CodeBuild プロジェクト
resource "aws_codebuild_project" "terraform_apply" {
  name          = "${var.project}-terraform-apply"
  description   = "Terraform apply"
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

    dynamic "environment_variable" {
      for_each = local.common_environment
      content {
        name  = environment_variable.value.name
        value = environment_variable.value.value
      }
    }
  }

  source {
    type            = "GITHUB"
    location        = var.github_repository_url
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = false
    }

    buildspec = file("${path.module}/buildspec_apply.yml")
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/aws/codebuild/${var.project}-terraform-apply"
      stream_name = "build-log"
      status      = "ENABLED"
    }
  }

  tags = {
    Name = "${var.project}-terraform-apply"
  }
}

# Terraform destroy 用 CodeBuild プロジェクト
resource "aws_codebuild_project" "terraform_destroy" {
  name          = "${var.project}-terraform-destroy"
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

    dynamic "environment_variable" {
      for_each = local.common_environment
      content {
        name  = environment_variable.value.name
        value = environment_variable.value.value
      }
    }
  }

  source {
    type            = "GITHUB"
    location        = var.github_repository_url
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = false
    }

    buildspec = file("${path.module}/buildspec_destroy.yml")
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "/aws/codebuild/${var.project}-terraform-destroy"
      stream_name = "build-log"
      status      = "ENABLED"
    }
  }

  tags = {
    Name = "${var.project}-terraform-destroy"
  }
}
