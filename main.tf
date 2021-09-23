terraform{
    required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~> 3.5"
      }
    }
}

provider "aws" {
  region = var.region
  shared_credentials_file = var.creds
  profile = "default"
}