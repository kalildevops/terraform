output vpc_id {
  value = module.network_eks.vpc_id
}

output vpc_id_cidr_block {
  value = module.network_eks.vpc_id_cidr_block
}

output subnet_priv1_id {
  value = module.network_eks.subnet_priv1_id
}

output subnet_pub1_id {
  value = module.network_eks.subnet_pub1_id
}

output subnet_priv2_id {
  value = module.network_eks.subnet_priv2_id
}

output subnet_pub2_id {
  value = module.network_eks.subnet_pub2_id
}

output igw_id {
  value = module.network_eks.igw_id
}

output nat_gw1_id {
  value = module.network_eks.nat_gw1_id
}

output nat_gw2_id {
  value = module.network_eks.nat_gw2_id
}