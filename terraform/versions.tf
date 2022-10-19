
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  cloud {
    organization = "Training1997"
 
    hostname = "app.terraform.io"

    workspaces {
      tags = ["Arctiq-iac-Mission"]
    }
  }
}