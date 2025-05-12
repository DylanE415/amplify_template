variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "app_name" {
  type = string               
}

variable "repo_url" {
  type = string               # e.g. "https://github.com/org/repo"
}

variable "branch" {
  type    = string
  default = "main"
}

# GitHub PAT with **repo → read-only** scope
variable "github_token" {
  type      = string
  sensitive = true
}
