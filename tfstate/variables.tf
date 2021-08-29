variable aws_region {
  type = string
  default = "us-east-1"
  description = "Default region"
}

variable aws_profile {
  type = string
  default = "github-user"
}

variable tfstate_bucket {
  type = string
  default = "github-kalil-tfstate"
}

variable tags {
  type = map
  default = {
    Creation = "Terraform"
  }
}