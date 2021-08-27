provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

# Variables not allowed here
terraform {
  backend "s3" {
    bucket = "github-kalil-tfstate"
    key    = "eks/terraform.state"
    region = "us-east-1"
    profile = "github-user"
  }
}