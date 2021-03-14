locals {
  allowed_ports = ["22", "80", "443", "6443"]
}

resource "aws_security_group" "cloud" {
  name_prefix = "${var.project}_securitygroup"
  description = "Used in the terraform"
  vpc_id      = var.vpc

  ingress {
    description = "wireguard access from anywhere"
    from_port   = 51820
    to_port     = 51820
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = local.allowed_ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description = "Outbound internet access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Connection between instances"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    self        = true
  }

  tags = {
    project = var.project
  }
}
