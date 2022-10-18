
terraform {
  cloud {
    organization = "example-org-7171dd"

    workspaces {
      name = "Arctiq-iac-Mission"
    }
  }

}