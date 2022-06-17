# General
variable aws_region {
  type = string
  default = "us-east-1"
}

variable aws_profile {
  type = string
  default = "github-user"
}

variable tfstate_bucket {
  type = string
  default = "github-kalil-tfstate"
}

variable tfstate_key {
  type = string
  default = "network_ansible_lab/terraform.state"
}

# Network
variable vpc_cidr_block {
  type        = string
  default     = "10.0.0.0/20"
}

variable priv_cidr_block {
  type        = string
  default     = "10.0.1.0/25"
}

variable pub_cidr_block {
  type        = string
  default     = "10.0.2.0/25"
}

variable network_name {
  type        = string
  default     = "vpc-network_ansible_lab"
}

variable tags {
  type = map
  default = {
    Creation = "Terraform"
  }
}