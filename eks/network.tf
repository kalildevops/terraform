# VPC
resource "aws_vpc" "this" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_support = true
  tags = var.tags
}

# Subnet Priv1
resource "aws_subnet" "subnet_priv1" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.priv1_cidr_block
  availability_zone = "us-east-1a"
  tags = var.tags
}

# Subnet Priv2
resource "aws_subnet" "subnet_priv2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.priv2_cidr_block
  availability_zone = "us-east-1b"
  tags = var.tags
}

# Subnet Pub1
resource "aws_subnet" "subnet_pub1" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pub1_cidr_block
  availability_zone = "us-east-1c"
  tags = var.tags
}

# Subnet Pub2
resource "aws_subnet" "subnet_pub2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pub2_cidr_block
  availability_zone = "us-east-1d"
  tags = var.tags
}