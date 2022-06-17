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
  default = "ansible_lab/terraform.state"
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