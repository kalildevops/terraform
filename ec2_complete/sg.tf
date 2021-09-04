resource "aws_security_group" "ec2-sg" {
  name        = "ec2-sg"
  description = "SG for EC2 instance"
  vpc_id      = module.network_ec2.vpc_id

  dynamic "ingress" {
    for_each = var.default_ingress
    content {
      description = ingress.value["description"]
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  tags = merge({ Name = "${var.ec2_key}-sg" }, var.tags)
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-sg.id
}
