resource "aws_instance" "db" {
  ami           = data.aws_ami.this.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ansible-lab-sg.id]
  subnet_id = data.aws_subnet.subnet_pub.id
  key_name = var.ec2_key

  tags = merge({ Name = "db" }, var.tags)
}
