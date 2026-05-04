
# CodeBuild サービスロール (既存ロールを参照)
data "aws_iam_role" "codebuild" {
  name = var.codebuild_role_name
}
