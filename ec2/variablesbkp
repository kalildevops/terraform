variable aws_region {
  type = string
  default = "us-east-1"
  description = "Default region"
}

variable aws_profile {
  type = string
  default = "github-user"
  description = "Default user"
}

variable ec2_key {
  type        = string
  default     = "ec2"
  description = "EC2 keypair name  for SSH"
}

variable tfstate_bucket {
  type = string
  default = "github-kalil-tfstate"
  description = "tfstate bucket"
}

variable tfstate_key {
  type = string
  default = "ec2/terraform.state"
  description = "tfstate bucket"
}

variable instance_type {
  type = string
  default = "t3.micro"
  description = "instance type"
}

variable ami_value {
  type = string
  default = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server*"
  description = "ami value"
}

variable ami_owner {
  type = string
  default = "099720109477" # Canonical
  description = "ami owner"
}

variable default_ingress {
  type = map(object({description = string, cidr_blocks = list(string)}))
  default = {
    22 = { description = "Inbound para SSH", cidr_blocksx }
  }
}

variable tags {
  type = map
  default = {
    OS = "Ubuntu20"
    Creation = "Terraform"
  }
}