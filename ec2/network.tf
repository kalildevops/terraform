# VPC
resource "aws_vpc" "this" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_support = true
  tags = merge({ Name = "${var.ec2_key}-vpc" }, var.tags)
}

# Subnet Priv
resource "aws_subnet" "subnet_priv" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.priv_cidr_block
  availability_zone = "us-east-1a"
  tags = merge({ Name = "${var.ec2_key}-subnet-priv" }, var.tags)
}

# Subnet Pub
resource "aws_subnet" "subnet_pub" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pub_cidr_block
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = merge({ Name = "${var.ec2_key}-subnet-pub" }, var.tags)
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = merge({ Name = "${var.ec2_key}-igw" }, var.tags)
}

# Create route for igw in VPC
resource "aws_route" "route-vpc-igw" {
  route_table_id = aws_vpc.this.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.this.id
}

# Elastic IP
resource "aws_eip" "this" {
  vpc = true
  tags = merge({ Name = "${var.ec2_key}-eip" }, var.tags)
}

# Public NAT Gateway
resource "aws_nat_gateway" "this" {
  depends_on = [aws_internet_gateway.this]
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.subnet_pub.id

  tags = merge({ Name = "${var.ec2_key}-nat-gw" }, var.tags)
}