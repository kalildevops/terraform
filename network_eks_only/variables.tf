# General
variable aws_region {
  type = string
  default = "us-east-1"
}

variable aws_profile {
  type = string
  default = "github-user"
}

# Tfstate
variable tfstate_bucket {
  type = string
  default = "github-kalil-tfstate"
}

# VPC
variable vpc_cidr_block {
  type = string
  default = "10.0.0.0/20"
}

# Subnet Priv1
variable priv1_cidr_block {
  type = string
  default = "10.0.0.0/26"
}

# Subnet Priv2
variable priv2_cidr_block {
  type = string
  default = "10.0.0.64/26"
}

# Subnet Pub1
variable pub1_cidr_block {
  type = string
  default = "10.0.0.128/26"
}

# Subnet Pub2
variable pub2_cidr_block {
  type = string
  default = "10.0.0.192/26"
}

# Network name
variable network_name {
  type        = string
  default     = "vpc-eks-only"
}

# EKS
variable eks_cluster_name {
  type = string
  default = "eks-cluster-github-only"
}

variable tfstate_key {
  type = string
  default = "network_eks_only/terraform.state"
}

# Tags
variable tags {
  type = map
  default = {
    Creation = "Terraform"
  }
}