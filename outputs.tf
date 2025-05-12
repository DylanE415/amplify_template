# Base domain Amplify owns (e.g. d2abc123defgh.amplifyapp.com)
output "amplify_default_domain" {
  value       = aws_amplify_app.app.default_domain
  description = "Amplify's root domain"
}

# Full HTTPS URL for this branch (e.g. https://main.d2abc123defgh.amplifyapp.com)
output "amplify_branch_url" {
  value       = "https://${var.branch}.${aws_amplify_app.app.default_domain}"
  description = "Public URL of the deployed branch"
}

# App ID (useful in later workflows / scripts)
output "amplify_app_id" {
  value       = aws_amplify_app.app.id
  description = "Amplify App ID"
}