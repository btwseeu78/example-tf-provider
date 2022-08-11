resource "github_repository" "example" {
  name        = "example-tf-provider"
  description = "My awesome codebase"
  auto_init   = true
  visibility = "public"
}

resource "github_repository_file" "foo" {
  repository          = github_repository.example.name
  branch              = "master"
  file                = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  commit_author       = "Terraform User"
  commit_email        = "terraform@example.com"
  overwrite_on_create = true
}

resource "github_branch" "development" {
  repository = github_repository.example.name
  branch     = "development"
  source_branch = "master"
}

resource "github_branch_default" "default"{
  repository = github_repository.example.name
  branch     = "master"
}