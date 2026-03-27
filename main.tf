provider "tfe" {
  hostname = var.tfc_hostname
  token    = var.tfc_token
}

module "spacelift-partner-test" {
  source = "./terraform-cloud-setup-module"

  # The email address of the Terraform Cloud organization admin
  organization_admin_email = "spacelift-migration-certification@spacelift.io"
  
  # This is used to setup a github integration in Terraform Cloud
  # its not actually used, since the code we are cloning is public
  # but it is required to setup the github integration
  github_pat = "{github personal access token ghp_}"
  
  # This points to the repository you forked in step 1
  tfc_workspace_vcs_repo = "dduong26/simple-module"
}

output "organization_name" {
  value = module.spacelift-partner-test.organization_name
}

variable "env" {
  type = string
  description = "The environment name"
  default = "dev"
}

resource "null_resource" "env" {
  triggers = {
    env = var.env
  }
}

output "env" {
  value = var.env
}
