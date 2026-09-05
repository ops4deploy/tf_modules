terraform {
  required_version = "1.16.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.63.0"
    }
  }

  backend "s3" {
    bucket       = "amzn-opsdeploy-dev-tf-state-s3"
    key          = "proj_ignite_app/env/dev/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}