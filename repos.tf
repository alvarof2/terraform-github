resource "github_repository" "terraform_github" {
  name        = "terraform-github"
  description = "Managing Github with TF"

  visibility = "public"
}

resource "github_branch_protection" "terraform_main" {
  repository_id = github_repository.terraform_github.node_id

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

  required_pull_request_reviews {
    required_approving_review_count = 1
  }

}