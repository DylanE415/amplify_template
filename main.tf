resource "aws_amplify_app" "app" {
  name        = var.app_name
  repository  = var.repo_url
  oauth_token = var.github_token       # GitHub Personal Access Token
  platform    = "WEB"                  # Amplify Hosting; buildSpec lives in repo
}

# 2. Production branch — auto-build enabled
resource "aws_amplify_branch" "prod" {
  app_id            = aws_amplify_app.app.id
  branch_name       = var.branch
  stage             = "PRODUCTION"
  enable_auto_build = true
}