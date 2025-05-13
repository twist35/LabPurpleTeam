module "vm_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "VM-sg"
  description = "Security group for SSH+HTTP access on VMs"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    description = "Allow SSH from anywhere"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow HTTP traffic from anywhere"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow HTTP traffic from anywhere"
    },
    {
      from_port   = 9090
      to_port     = 9090
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow HTTP traffic from anywhere"
    },
  ]
  egress_with_cidr_blocks = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
    description = "Allow all outbound traffic"
  }]

  tags = {
    Name        = "VM-SG"
  }
}

