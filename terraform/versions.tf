
terraform {


  cloud {
      organization = "Training1997"

      workspaces {
        name = "Arctiq-iac-Mission"
      }
    }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.2"
    }
  }
  
}