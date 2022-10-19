
terraform {
  cloud {
    organization = "Training1997"
 
    hostname = "app.terraform.io"

    workspaces {
      tags = ["Arctiq-iac-Mission"]
    }
  }
}