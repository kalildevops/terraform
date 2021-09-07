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

variable tfstate_key {
  type = string
  default = "eks_only/terraform.state"
}

# EKS
variable eks_cluster_name {
  type = string
  default = "eks-cluster-github-only"
}

# Tags
variable tags {
  type = map
  default = {
    Creation = "Terraform"
  }
}