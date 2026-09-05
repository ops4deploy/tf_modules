locals {
  project     = "opsdeploy"
  application = "eagle"
  env         = "dev"
  region      = "ap-south-1"
  name_prefix = "${local.project}-${local.application}-${local.env}"
}



module "iam_user" {
  source = "../../../_modules/iam/iam_user"

  name_prefix   = local.name_prefix
  iam_user_name = "alpha1"
}

module "iam_role" {
  source = "../../../_modules/iam/iam_role"

  name_prefix   = local.name_prefix
  iam_role_name = "alpha1"
}

module "iam_policy" {
  source = "../../../_modules/iam/iam_policy"

  name_prefix     = local.name_prefix
  iam_policy_name = "alpha1"
  iam_user_name   = module.iam_user.name

}