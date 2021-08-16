resource "aws_security_group" "ec2-sg" {
  name        = "ec2-sg"
  description = "SG for EC2 instance"

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

  tags = var.tags
}
