locals {
  project     = "ignite"
  application = "app"
  env         = "dev"
  region      = "ap-south-1"
  name_prefix = "${local.application}-${local.env}"

  default_tags = {
    Project     = local.project
    Application = local.application
    Environment = local.env
    CreatedBy   = "Terraform"
    Owner       = "Pawan Kumar (DevOps)"
  }
}



module "vpc" {
  source = "../../../../_modules/vpc"

  name_prefix  = local.name_prefix
  default_tags = local.default_tags
  vpc_name     = "ignite"


  vpc_cidr_block = "172.16.0.0/16"
  subnets = {
    public  = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
    private = ["172.16.4.0/24", "172.16.5.0/24", "172.16.6.0/24"]

  }

}