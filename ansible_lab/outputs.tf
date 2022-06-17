output sg_id {
  value = aws_security_group.ansible-lab-sg.id
}

output instance_inst1_id {
  value = aws_instance.inst1.id
}

output public_inst1_ip {
  value = aws_instance.inst1.public_ip
}

output instance_inst2_id {
  value = aws_instance.inst2.id
}

output public_inst2_ip {
  value = aws_instance.inst2.public_ip
}

output instance_db_id {
  value = aws_instance.db.id
}

output public_db_ip {
  value = aws_instance.db.public_ip
}