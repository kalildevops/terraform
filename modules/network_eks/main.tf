# VPC
resource "aws_vpc" "this" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_support = true
  tags = merge({ Name = var.network_name }, var.tags)
}

# Subnet Priv1
resource "aws_subnet" "subnet_priv1" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.priv1_cidr_block
  availability_zone = "us-east-1a"
  tags = merge({ Name = "${var.network_name}-subnet-priv1" }, var.tags)
}

# Subnet Priv2
resource "aws_subnet" "subnet_priv2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.priv2_cidr_block
  availability_zone = "us-east-1b"
  tags = merge({ Name = "${var.network_name}-subnet-priv2" }, var.tags)
}

# Subnet Pub1
resource "aws_subnet" "subnet_pub1" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pub1_cidr_block
  availability_zone = "us-east-1c"
  tags = merge({ Name = "${var.network_name}-subnet-pub1" }, var.tags)
}

# Subnet Pub2
resource "aws_subnet" "subnet_pub2" {
  vpc_id     = aws_vpc.this.id
  cidr_block = var.pub2_cidr_block
  availability_zone = "us-east-1d"
  tags = merge({ Name = "${var.network_name}-subnet-pub2" }, var.tags)
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

# Elastic IP 1
resource "aws_eip" "eip1" {
  vpc = true
  tags = merge({ Name = "${var.network_name}-eip1" }, var.tags)
}

# Public NAT Gateway 1
resource "aws_nat_gateway" "nat_gw1" {
  depends_on = [aws_internet_gateway.this]
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.subnet_pub1.id

  tags = merge({ Name = "${var.network_name}-nat-gw1" }, var.tags)
}

# Elastic IP 2
resource "aws_eip" "eip2" {
  vpc = true
  tags = merge({ Name = "${var.network_name}-eip2" }, var.tags)
}

# Public NAT Gateway 2
resource "aws_nat_gateway" "nat_gw2" {
  depends_on = [aws_internet_gateway.this]
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.subnet_pub2.id

  tags = merge({ Name = "${var.network_name}-nat-gw2" }, var.tags)
}