locals {
  common_environment = [
    {
      name  = "TF_VERSION"
      value = "1.6.6"
    },
    {
      name  = "TF_WORKING_DIR"
      value = "terraform-resource"
    },
    {
      name  = "ENV"
      value = var.environment
    }
  ]
}

# CodeBuild サービスロール (既存ロールを参照)
data "aws_iam_role" "codebuild" {
  name = var.codebuild_role_name
}
