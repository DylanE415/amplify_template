resource "aws_amplify_app" "app" {
  name        = var.app_name
  repository  = var.repo_url
  oauth_token = var.github_token       # GitHub Personal Access Token
  platform    = "WEB"   
  build_spec  = local.build_spec                # Amplify Hosting; buildSpec lives in repo
}

# 2. Production branch — auto-build enabled
resource "aws_amplify_branch" "prod" {
  app_id            = aws_amplify_app.app.id
  branch_name       = var.branch
  stage             = "PRODUCTION"
  enable_auto_build = true

}

# need to kick off start job 
resource "null_resource" "trigger_build" {

  depends_on = [aws_amplify_branch.prod]

  provisioner "local-exec" {
    command = <<EOT
      set -e                                     
      echo "▶ Starting initial Amplify build…"
      aws amplify start-job \
        --app-id      ${aws_amplify_app.app.id} \
        --branch-name ${aws_amplify_branch.prod.branch_name} \
        --job-type    RELEASE \
        --region      ${var.aws_region}
    EOT

  }
}

