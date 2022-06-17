provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

# Variables not allowed here
terraform {
  backend "s3" {
    bucket = "github-kalil-tfstate"
    key    = "ansible_lab/terraform.state"
    region = "us-east-1"
    profile = "github-user"
  }
}

data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_value]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.ami_owner]
}

data "aws_subnet" "subnet_pub" {
  filter {
    name   = "tag:Name"
    values = ["vpc-network_ansible_lab-subnet-pub"]
  }
}