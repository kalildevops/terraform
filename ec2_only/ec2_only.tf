data "aws_ami" "this" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_value]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.ami_owner]
}

data "aws_subnet" "subnet_pub" {
  filter {
    name   = "tag:Name"
    values = ["vpc-github-subnet-pub"]
  }
}

resource "aws_instance" "this" {
  ami           = data.aws_ami.this.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  subnet_id = data.aws_subnet.subnet_pub.id
  key_name = var.ec2_key

  tags = merge({ Name = "${var.ec2_key}-minimal" }, var.tags)
}
