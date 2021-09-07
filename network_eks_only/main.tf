provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

# Variables not allowed here
terraform {
  backend "s3" {
    bucket = "github-kalil-tfstate"
    key    = "network_eks_only/terraform.state"
    region = "us-east-1"
    profile = "github-user"
  }
}

module "network_eks" {
  source = "../modules/network_eks"

  aws_region       = var.aws_region
  aws_profile      = var.aws_profile
  tfstate_bucket   = var.tfstate_bucket
  tfstate_key      = var.tfstate_key
  vpc_cidr_block   = var.vpc_cidr_block
  priv1_cidr_block = var.priv1_cidr_block
  pub1_cidr_block  = var.pub1_cidr_block
  priv2_cidr_block = var.priv2_cidr_block
  pub2_cidr_block  = var.pub2_cidr_block
  network_name     = var.network_name
  tags             = var.tags
}