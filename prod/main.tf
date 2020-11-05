##################################################################################
# VPC
##################################################################################
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
}

module "network" {
  source = "../modules/network"

  cidr            = var.cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  #TAGS

  name             = var.name
  project_tag      = var.project_tag
  environment_tag  = var.environment_tag
  requester_tag    = var.requester_tag
  billing_code_tag = var.billing_code_tag

} 