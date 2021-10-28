output sg_id {
  value = aws_security_group.ec2-sg.id
}

output master_instance_id {
  value = aws_instance.master.id
}

output node1_instance_id {
  value = aws_instance.node1.id
}

output node2_instance_id {
  value = aws_instance.node2.id
}

output master_public_ip {
  value = aws_instance.master.public_ip
}

output node1_public_ip {
  value = aws_instance.node1.public_ip
}

output node2_public_ip {
  value = aws_instance.node2.public_ip
}