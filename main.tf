provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "doctolib" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.doctolib.id]
  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "doctolib" {
  name_prefix = "doctolib-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.allowed_ip}/32"]
  }
}