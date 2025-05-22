module "vm_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "VM-sg"
  description = "Security group for SSH+HTTP access on VMs"
  vpc_id      = aws_vpc.main.id

  ingress_with_cidr_blocks = [
    {
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
      from_port   = 10050
      to_port     = 10050
      protocol    = "tcp"
      cidr_blocks = data.aws_vpc.main.cidr_block
      description = "Allow zaabix traffic from vpc"
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

module "bodega_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "bodega_sg"
  description = "Security group for SSH+HTTP access on VMs"
  vpc_id      = aws_vpc.main.id

  egress_with_cidr_blocks = [{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
    description = "Allow all outbound traffic"
  }]

  tags = {
    Name        = "bodega_sg"
  }
}


module "lenox_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "lenox_sg"
  description = "Security group for SSH+HTTP access on VMs"
  vpc_id      = aws_vpc.main.id

  ingress_with_cidr_blocks = [
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
    {
      from_port   = 10050
      to_port     = 10050
      protocol    = "tcp"
      cidr_blocks = data.aws_vpc.main.cidr_block
      description = "Allow zaabix traffic from vpc"
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
    Name        = "lenox_sg"
  }
}

module "lenox_private_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "lenox_private_sg"
  description = "Security group for private lenox"
  vpc_id      = aws_vpc.main.id

  ingress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = aws_subnet.public.cidr_block
      description = "Allow HTTPS traffic from bastion"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = aws_subnet.public.cidr_block
      description = "Allow HTTP traffic from bastion"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = aws_subnet.public.cidr_block
      description = "Allow SSH traffic from bastion"
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
    Name        = "lenox_private_sg"
  }
}

