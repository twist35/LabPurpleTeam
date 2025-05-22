# ------------------------------
# Sécurité pour l'instance NAT
# ------------------------------
resource "aws_security_group" "nat_sg" {
  name        = "nat-instance-sg"
  description = "Allow NAT traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_subnet.private.cidr_block]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nat-instance-sg"
  }
}

# ------------------------------
# ENI pour l'instance NAT
# ------------------------------
resource "aws_network_interface" "nat_eni" {
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.nat_sg.id]
  source_dest_check = false
  private_ips = ["10.0.2.100"]

  tags = {
    Name = "nat-eni"
  }
}

# ------------------------------
# EIP pour l'instance NAT
# ------------------------------
resource "aws_eip" "nat_eip" {
  domain = "vpc" 
}

resource "aws_eip_association" "nat_assoc" {
  allocation_id        = aws_eip.nat_eip.id
  network_interface_id = aws_network_interface.nat_eni.id
}

# ------------------------------
# Instance NAT
# ------------------------------
resource "aws_instance" "nat" {
  ami               = "ami-0137cee1a6fb4f763"  # AMI NAT AWS
  instance_type     = "t3.nano"  # Utilise la variable pour l'instance_type
  key_name          = aws_key_pair.vm_key.key_name  # Utilise la variable pour la clé SSH

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.nat_eni.id
  }

  tags = {
    Name = "NAT-Bastion-Instance"
  }
}