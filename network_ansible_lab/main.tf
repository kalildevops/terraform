provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

# Variables not allowed here
terraform {
  backend "s3" {
    bucket = "github-kalil-tfstate"
    key    = "network_ansible_lab/terraform.state"
    region = "us-east-1"
    profile = "github-user"
  }
}

module "network_ansible_lab" {
  source = "../modules/network_ansible_lab"

  aws_region      = var.aws_region
  aws_profile     = var.aws_profile
  tfstate_bucket  = var.tfstate_bucket
  tfstate_key     = var.tfstate_key
  vpc_cidr_block  = var.vpc_cidr_block
  priv_cidr_block = var.priv_cidr_block
  pub_cidr_block  = var.pub_cidr_block
  network_name    = var.network_name
  tags            = var.tags
}