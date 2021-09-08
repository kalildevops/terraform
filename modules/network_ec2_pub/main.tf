# VPC
resource "aws_vpc" "this" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_support = true
  tags = merge({ Name = var.network_name }, var.tags)
}

# Subnet Pub
resource "aws_subnet" "subnet_pub" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pub_cidr_block
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = merge({ Name = "${var.network_name}-subnet-pub" }, var.tags)
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = merge({ Name = "${var.network_name}-igw" }, var.tags)
}

# Create route for igw in VPC
resource "aws_route" "route-vpc-igw" {
  route_table_id = aws_vpc.this.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.this.id
}