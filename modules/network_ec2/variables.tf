# General
variable aws_region {}
variable aws_profile {}
variable tfstate_bucket {}
variable tfstate_key {}

# Network
variable vpc_cidr_block {}
variable priv_cidr_block {}
variable pub_cidr_block {}
variable network_name {}
variable tags {
  type = map
}