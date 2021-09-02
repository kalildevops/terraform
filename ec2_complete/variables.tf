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
  default = "ec2_complete/terraform.state"
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

# EC2
variable ec2_key {
  type        = string
  default     = "ec2-github"
}

variable instance_type {
  type = string
  default = "t3.micro"
}

variable ami_value {
  type = string
  default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server*"
}

variable ami_owner {
  type = string
  default = "099720109477" # Canonical
}

# SG
variable default_ingress {
  type = map(object({description = string, cidr_blocks = list(string)}))
  default = {
    22 = { description = "Inbound para SSH", cidr_blocksx }
  }
}

variable tags {
  type = map
  default = {
    Creation = "Terraform"
  }
}