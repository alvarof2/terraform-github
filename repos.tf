resource "github_repository" "terraform_github" {
  name        = "terraform-github"
  description = "Managing Github with TF"

  visibility = "public"

  allow_merge_commit = false
  allow_rebase_merge = false
  delete_branch_on_merge = true
}

resource "github_repository_file" "terraform_github_readme" {
  repository          = github_repository.terraform_github.name
  branch              = "main"
  file                = "README.md"
  content             = "# Manage Github with Terraform"
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      content,
    ]
  }

}

resource "github_branch_protection" "terraform_github_main" {
  repository_id = github_repository.terraform_github.node_id

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

  require_signed_commits = true
  required_linear_history = true

  required_pull_request_reviews {
    required_approving_review_count = 0
  }

  required_status_checks {
    strict = true
  }

}