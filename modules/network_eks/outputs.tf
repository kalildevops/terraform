output vpc_id {
  value = aws_vpc.this.id
}

output vpc_id_cidr_block {
  value = aws_vpc.this.cidr_block
}

output subnet_priv1_id {
  value = aws_subnet.subnet_priv1.id
}

output subnet_pub1_id {
  value = aws_subnet.subnet_pub1.id
}

output subnet_priv2_id {
  value = aws_subnet.subnet_priv2.id
}

output subnet_pub2_id {
  value = aws_subnet.subnet_pub2.id
}

output igw_id {
  value = aws_internet_gateway.this.id
}

output nat_gw1_id {
  value = aws_nat_gateway.nat_gw1.id
}

output nat_gw2_id {
  value = aws_nat_gateway.nat_gw2.id
}