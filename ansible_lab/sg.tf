data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = ["vpc-network_ansible_lab"]
  }
}

resource "aws_security_group" "ansible-lab-sg" {
  name        = "ansible-lab-sg"
  description = "SG for Ansible Lab"
  vpc_id      = data.aws_vpc.this.id

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

  tags = merge({ Name = "ansible-lab-sg" }, var.tags)
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ansible-lab-sg.id
}