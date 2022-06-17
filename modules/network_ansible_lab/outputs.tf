output vpc_id {
  value = aws_vpc.this.id
}

output vpc_id_cidr_block {
  value = aws_vpc.this.cidr_block
}

output subnet_priv_id {
  value = aws_subnet.subnet_priv.id
}

output subnet_pub_id {
  value = aws_subnet.subnet_pub.id
}

# output igw_id {
#   value = aws_internet_gateway.this.id
# }

# output nat_gw_id {
#   value = aws_nat_gateway.this.id
# }