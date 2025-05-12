module "lenox_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "lenox-sg"
  description = "Security group for SSH access"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    description = "Allow SSH from anywhere"
  }]

  egress_with_cidr_blocks = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
    description = "Allow all outbound traffic"
  }]

  tags = {
    Name = "SSH-SG"
    Environment = "Development"
  }
}

