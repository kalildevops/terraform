resource "aws_security_group" "ec2-sg" {
  name        = "ec2-sg"
  description = "SG for EC2 instance"
  vpc_id      = aws_vpc.this.id

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

  # egress = [
  #   {
  #     from_port        = 0
  #     to_port          = 0
  #     protocol         = -1
  #     cidr_blocks      = ["0.0.0.0/0"]
  #     ipv6_cidr_blocks = ["::/0"]
  #   }
  # ]

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
