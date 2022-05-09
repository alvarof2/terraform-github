resource "github_repository" "terraform_github" {
  name        = "terraform-github"
  description = "Managing Github with TF"

  visibility = "public"
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
}
