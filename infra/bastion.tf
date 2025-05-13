resource "aws_instance" "vm_bastion" {
  ami                         = var.ami
  instance_type               = "t3.nano"
  key_name                    = aws_key_pair.vm_key.key_name
  vpc_security_group_ids      = [module.bastion_sg.security_group_id]
  subnet_id                   = aws_subnet.public.id
  private_ip                  = "10.0.2.30" # IP privée statique
  associate_public_ip_address = true


  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name = "Bastion-VM"
  }
}


module "bastion_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "Bastion-sg"
  description = "Security group for SSH access on Bastion"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
    description = "Allow SSH from anywhere"
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
    Name        = "Bastion-SG"
  }
}